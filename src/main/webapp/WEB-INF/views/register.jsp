<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

						<h3>Crie sua Conta de Usu�rio</h3>
						<p>Informe seus dados para cadastrar sua conta.</p>
					</div>

					<hr />

					<form id="formRegister" method="post" action="register-user">

						<div class="mb-3">
							<label>Nome de usu�rio:</label> 
							<form:input path="model.nome" id="nome" name="nome" type="text" class="form-control" placeholder="Digite seu nome aqui"/>
						</div>

						<div class="mb-3">
							<label>Email de acesso:</label>
							<form:input path="model.email"  id="email" name="email" type="text" class="form-control" placeholder="Digite seu email aqui"/>
						</div>

						<div class="mb-3">
							<label>Senha de acesso:</label>
							<form:input path="model.senha"  id="senha" name="senha" type="password" class="form-control" placeholder="Digite sua senha aqui"/>
						</div>

						<div class="mb-3">
							<label>Confirme sua Senha de acesso:</label> 
							<form:input path="model.senhaConfirmacao"  id="senhaConfirmacao" name="senhaConfirmacao" type="password" class="form-control"
								placeholder="Confirme sua senha aqui"/>
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<input type="submit" value="Realizar Cadastro"
									class="btn btn-success" />
							</div>
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<a href="/agendaweb/" class="btn btn-light"> Voltar para a
									p�gina inicial.</a>

							</div>
						</div>
						<div class="mb-3 text-center">
						<strong class="success">
						${mensagem_sucesso}
						</strong>
						<strong class="text-danger">
						${mensagem_erro}
						</strong>
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

		$("#formRegister").validate({
			rules : {
			'nome' : {required : true, minlength : 6, maxlength : 150},
			'email' : {required : true, email : true},
			'senha' : {required : true,minlength : 8, maxlength : 20},
			'senhaConfirmacao' : {required : true, equalTo : '#senha'}
			},
			messages : {
				senha : {pwcheck : 'Infome ao menos 1 letra mai�scula , 1 letra min�scula e um n�mero'}
			}
		})
		
		//valida��o customizada para campo de senha forte
		$.validator.addMethod('pwcheck', function(value, element){
			
			return /^[A-Za-z0-9]+$/.test(value);
			})
	})
	
	</script>
</body>
</html>