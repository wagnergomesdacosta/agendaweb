package br.com.cotiinformatica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.cotiinformatica.entities.Usuario;
import br.com.cotiinformatica.models.LoginModel;
import br.com.cotiinformatica.repositories.UsuarioRepository;

@Controller
public class LoginController {

	@RequestMapping(value = "/")
	public ModelAndView login() {

		// aqui abre a pagina login
		ModelAndView modelAndView = new ModelAndView("login");// WEB-INF/views/login.jsp

		// aqui captura a model que se refere a .jsp
		modelAndView.addObject("model", new LoginModel());
		return modelAndView;

	}

	@RequestMapping(value = "/login-user") // precisa ser igual o action do form da jsp
	public ModelAndView loginUser(LoginModel model, HttpServletRequest request) {

		// aqui abre a pagina login
		ModelAndView modelAndView = new ModelAndView("login");// WEB-INF/views/login.jsp

		try {
			// consultar usuario no banco de dados através do email e senha
			UsuarioRepository usuarioRepository = new UsuarioRepository();
			Usuario usuario = usuarioRepository.find(model.getEmail(), model.getSenha());

			if (usuario != null) {// usuario foi encontrado

				// salvar os dados do usuário em uma sessão
				request.getSession().setAttribute("usuario_auth", usuario);

				// redirecionamento...
				modelAndView.setViewName("redirect:/tarefas-consulta");

			} else {// usuario não foi encontrado
				modelAndView.addObject("mensagem_erro", "Acesso negado. Email ou senha invalidos.");

			}

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", "Ocorreu um erro: " + e.getMessage());

		}

		// aqui captura a model que se refere a .jsp
		modelAndView.addObject("model", new LoginModel());
		return modelAndView;

	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) {

		// destruir sessão
		request.getSession().removeAttribute("usuario_auth");

		// redireciona para a raiz do projeto
		ModelAndView modelAndView = new ModelAndView("redirect:/");

		return modelAndView;
	}

}
