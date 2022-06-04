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
label.error {
	color: red;
}

input.error, select.error, textarea.error {
	border: 2px solid red;
}
</style>

</head>

<body class="bg-secondary">

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">

			<div class="card">
				<div class="card-body">
					<div class="text-center">

						<h3>Esqueci minha senha</h3>
						<p>Informe seu email para recupera��o da senha.</p>
					</div>

					<hr />

					<form id="formRecuperarSenha"
						action="recuperar-senharecuperarSenha" method="post">

						<div class="mb-3">
							<label>Email de acesso:</label>
							<form:input path="model.email" type="text" id="email"
								name="email" class="form-control"
								placeholder="Digite seu email aqui">
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<input type="submit" value="Recuperar Senha"
									class="btn btn-success" />
							</div>
						</div>

						<div class="mb-3">
							<div class="d-grid">
								<a href="/agendaweb/" class="btn btn-light"> Voltar para a
									p�gina inicial.</a>

							</div>
						</div>

					</form>

					<div class="mt-3 text-success text-center">
						<strong>${menssagem_sucesso}</strong>
					</div>
					<div class="mt-3 text-success text-danger">
						<strong>${menssagem_erro}</strong>
					</div>





				</div>
			</div>
		</div>
	</div>

	<!-- arquivos de extens�o javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

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
		$(document).ready(function() {

			$("#formRecuperarSenha").validate({
				rules : {
					'email' : {
						required : true,
						email : true
					}

				},
			})
		})
	</script>


</body>
</html>