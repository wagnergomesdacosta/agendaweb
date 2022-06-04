<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edi��o de tarefas</title>

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
<body>

	<!-- menu do sistema -->
	<jsp:include page="/WEB-INF/components/menu.jsp"></jsp:include>

	<!-- menu do sistema -->
	<jsp:include page="/WEB-INF/components/mensagens.jsp"></jsp:include>

	<div class="container mt-3">
		<h5>Edi��o de tarefas</h5>
		<p>Utilize o formul�rio abaixo para cadastrar uma tarefa.</p>
		<hr>

		<form id="formEdicao" action="atualizar-tarefa" method="post">

			<!-- campo oculto -->
			<form:input path="model.idTarefa" type="hidden" />



			<div class="row mb-3">
				<div class="col md-6">
					<label>Nome da tarefa</label>
					<form:input path="model.nome" type="text" id="nome" name="nome"
						class="form-control" placeholder="Digite aqui" />
				</div>
				<div class="col md-2">
					<label>Data da tarefa</label>
					<form:input path="model.data" type="date" id="data" name="data"
						class="form-control" />
				</div>
				<div class="col md-2">
					<label>Hora da tarefa</label>
					<form:input path="model.hora" type="time" id="hora" name="hora"
						class="form-control" />
				</div>
				<div class="col md-2">
					<label>Prioridade</label>
					<form:select path="model.prioridade" id="prioridade"
						name="prioridade" class="form-control">
						<option value="">Selecione</option>
						<option value="1" ${model.prioridade == '1' ? 'selected' : '' }>ALTA</option>
						<option value="2" ${model.prioridade == '2' ? 'selected' : '' }>M�DIA</option>
						<option value="3" ${model.prioridade == '3' ? 'selected' : '' }>BAIXA</option>
					</form:select>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col md-12">
					<label>Descri��o da tarefa</label>
					<form:textarea path="model.descricao" class="form-control"
						id="descricao" name="descricao" rows="4" placeholder="Digite aqui"></form:textarea>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col md-12">
					<input type="submit" value="Alterar Cadastro"
						class="btn btn-success" />
				</div>
			</div>

		</form>
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
		$(document).ready(function() {

			$("#formEdicao").validate({
				rules : {
					'nome' : {
						required : true
					},
					'data' : {
						required : true
					},
					'hora' : {
						required : true
					},
					'prioridade' : {
						required : true
					},
					'descricao' : {
						required : true
					}

				},
			})
		})
	</script>
</body>
</html>