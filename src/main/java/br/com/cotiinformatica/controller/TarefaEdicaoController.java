package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Tarefa;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.helpers.DateHelper;
import br.com.cotiinformatica.models.TarefaEdicaoModel;
import br.com.cotiinformatica.repositories.TarefaRepository;

@Controller
public class TarefaEdicaoController {

	@RequestMapping(value = "/tarefas-edicao")
	public ModelAndView edicao(Integer id, HttpServletRequest request) {

		TarefaEdicaoModel model = new TarefaEdicaoModel();

		ModelAndView modelAndView = new ModelAndView("tarefas-edicao");

		try {

			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");

			TarefaRepository tarefaRepository = new TarefaRepository();
			Tarefa tarefa = tarefaRepository.findById(id);

			// verificando se a tarefa obtida pertence ao usuario
			if (tarefa.getIdUsuario() == usuario.getIdUsuario()) {

				model.setIdTarefa(tarefa.getIdTarefa());
				model.setNome(tarefa.getNome());
				model.setData(DateHelper.formatToString(tarefa.getData()));
				model.setHora(tarefa.getHora());
				model.setDescricao(tarefa.getDescricao());
				model.setPrioridade(tarefa.getPrioridade().toString());

			}

		} catch (Exception e) {
			modelAndView.addObject("menssagem_erro", e.getMessage());
		}

		modelAndView.addObject("model", model);
		return modelAndView;
	}
	@RequestMapping(value = "atualizar-tarefa", method = RequestMethod.POST)
	public ModelAndView atualizarTarefa(TarefaEdicaoModel model, HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("tarefas-edicao");
		
		
		modelAndView.addObject("model", model);
		return modelAndView;
	}
}
