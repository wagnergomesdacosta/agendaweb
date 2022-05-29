<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>COTI Inform�tica</title>

<!-- folhas de estilo CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

<!-- estilos para o JQuery validation -->
<style>
label.error { color : red; }
input.error { border : 2px solid red; }
</style>

</head>

<body class="bg-secondary">

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">

			<div class="card">
				<div class="card-body">
					<div class="text-center">

						<img
							src="https://www.cotiinformatica.com.br/imagens/logo-coti-informatica.png">
						<h3>Bem vinda a Agenda Web</h3>
						<p>Informe seus dados para acessar ao Sistema.</p>
					</div>

					<hr />

					<form id="formLogin" action="login-user" method="post">

						<div class="mb-3">
							<label>Email de acesso:</label> 
							<form:input path="model.email" type="text" id="email" name="email" class="form-control" placeholder="Digite seu email aqui"/>
						</div>

						<div class="mb-3">
							<label>Senha de acesso:</label> 
							<form:input path="model.senha" type="password" id="senha" name="senha" class="form-control" placeholder="Digite sua senha aqui"/>
							<div class="text-end">
								<a href="/agendaweb/password"> Esqueci minha senha </a>
							</div>
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<input type="submit" value="Acessar Agenda"
									class="btn btn-primary" />

							</div>
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<a href="/agendaweb/register" class="btn btn-light"> Ainda
									n�o possui conta? <strong>Cadastre-se aqui.</strong>
								</a>

							</div>
						</div>

				<div class="mb-3">
				<div class="text-center">
				<strong class="text-danger">
				${mensagem_erro}
				</strong>
				</div>
				</div>
					</form>
				</div>
			</div>
		</div>
	</div>
					
<!-- arquivos de extens�o javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- biblioteca do JQuery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>
	
	<!-- biblioteca do JQuery -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	
	<script>
	
	//fun��o para inicializar o c�digo javascript(JQuery)
	$(document).ready(function(){

		$("#formLogin").validate({
			rules : {
			'email' : {required : true, email : true},
			'senha' : {required : true,minlength : 8, maxlength : 20},
					},
				})
		})
	
	</script>
	
</body>
</html>