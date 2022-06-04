package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.model.MinhaContaModel;
import br.com.cotiinformatica.repositories.UsuarioRepository;

@Controller
public class MinhaContaController {

	@RequestMapping(value = "/minhaconta")
	public ModelAndView minhaConta() {

		ModelAndView modelAndView = new ModelAndView("minhaconta");
		modelAndView.addObject("model", new MinhaContaModel());

		return modelAndView;
	}

	@RequestMapping(value = "/atualizar-senha", method = RequestMethod.POST)
	public ModelAndView alterarSenha(MinhaContaModel model, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView("minhaconta");

		try {

			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario_auth");
			UsuarioRepository usuarioRepository = new UsuarioRepository();
			usuarioRepository.update(usuario.getIdUsuario(), model.getSenha());

			modelAndView.addObject("menssagem_sucesso", "Senha atualizada com sucesso!");

		} catch (Exception e) {
			modelAndView.addObject("menssagem_erro", e.getMessage());

		}

		modelAndView.addObject("model", new MinhaContaModel());
		return modelAndView;
	}

}