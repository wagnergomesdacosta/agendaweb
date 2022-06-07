package br.com.cotiinformatica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.models.PasswordModel;
import br.com.cotiinformatica.repositories.UsuarioRepository;

@Controller
public class PasswordController {

	@RequestMapping(value = "/password")
	public ModelAndView password() {

		ModelAndView modelAndView = new ModelAndView("password");
		modelAndView.addObject("model", new PasswordModel());

		return modelAndView;
	}

	@RequestMapping(value = "/recuperar-senha", method = RequestMethod.POST)
	public ModelAndView recuperarSenha(PasswordModel model) {

		ModelAndView modelAndView = new ModelAndView("password");

		try {

			// pesquisar o suario n o banco de dados
			UsuarioRepository usuarioRepository = new UsuarioRepository();
			Usuario usuario = usuarioRepository.find(model.getEmail());

			// verificar se o usuario foi encontrado
			if (usuario != null) {

			} else {

				throw new Exception("Email invalido, Usuário não encontrado.");

			}

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}

		modelAndView.addObject("model", model);
		return modelAndView;

	}

}
