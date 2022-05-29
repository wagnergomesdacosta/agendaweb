package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Tarefa;
import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.helpers.DateHelper;
import br.com.cotiinformatica.models.TarefaCadastroModel;
import br.com.cotiinformatica.repositories.TarefaRepository;

@Controller
public class TarefaCadastroController {

	@RequestMapping(value = "/tarefas-cadastro")
	public ModelAndView cadastro() {

		ModelAndView modelAndView = new ModelAndView("tarefas-cadastro");
		modelAndView.addObject("model", new TarefaCadastroModel());

		return modelAndView;
	}

	@RequestMapping(value = "/cadastrar-tarefa", method = RequestMethod.POST)
	public ModelAndView cadastrarTarefa(TarefaCadastroModel model, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("tarefas-cadastro");

		try {
			//capturar usuario autenticado no sistema
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");
			
			//capturar os dados da tarefa
			Tarefa tarefa = new Tarefa();
			
			tarefa.setNome(model.getNome());
			tarefa.setData(DateHelper.formatToDate(model.getData()));
			tarefa.setHora(model.getHora());
			tarefa.setPrioridade(Integer.valueOf(model.getPrioridade()));
			tarefa.setDescricao(model.getDescricao());
			tarefa.setIdUsuario(usuario.getIdUsuario());
			
			TarefaRepository tarefaRepository = new TarefaRepository();
			tarefaRepository.create(tarefa);
			
			//gerar mensagem de sucesso
			modelAndView.addObject("mensagem_sucesso", "Parabéns! A tarefa '" + tarefa.getNome() + "' foi cadastrada com sucesso.");
			
		} catch (Exception e) {
			//gerar mensagem de erro
			modelAndView.addObject("menssagem_erro", e.getMessage());

		}
		
		modelAndView.addObject("model", new TarefaCadastroModel());
		return modelAndView;
	}
}