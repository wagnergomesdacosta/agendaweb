package br.com.cotiinformatica.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Tarefa;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.models.TarefaConsultaModel;
import br.com.cotiinformatica.repositories.TarefaRepository;

@Controller
public class TarefaConsultaController {

	@RequestMapping(value = "/tarefas-consulta")
	public ModelAndView consulta() {

		ModelAndView modelAndView = new ModelAndView("tarefas-consulta");
		modelAndView.addObject("model", new TarefaConsultaModel());

		return modelAndView;
	}

	@RequestMapping(value = "/consultar-tarefas", method = RequestMethod.POST)
	public ModelAndView consultarTarefa(TarefaConsultaModel model, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("tarefas-consulta");

		try {
			// capturar usuario autenticado
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");

			// executar a consulta de tarefas
			TarefaRepository tarefaRepository = new TarefaRepository();
			List<Tarefa> tarefas = tarefaRepository.findAll(model.getNome(), usuario.getIdUsuario());

			// enviando lista de tarefas para a pagina
			modelAndView.addObject("tarefas", tarefas);

			// enviando mensagens
			if (tarefas.size() > 0) {

				modelAndView.addObject("mensagem_sucesso", tarefas.size() + "tarefa(s) obtida(s) para a consulta realizada");

			} else {

				modelAndView.addObject("mensagem_sucesso", "nenhum resultado encontrado para a consulta realizada");

			}

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}

		modelAndView.addObject("model", new TarefaConsultaModel());
		return modelAndView;
	}
}
