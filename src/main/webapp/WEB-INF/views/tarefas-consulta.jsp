<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulta de Tarefas</title>

<!-- folhas de estilo CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

</head>
<body>

<!-- menu do sistema -->
<jsp:include page="/WEB-INF/components/menu.jsp"></jsp:include>

<!-- mensagens -->
<jsp:include page="/WEB-INF/components/mensagens.jsp"></jsp:include>

	<div class="container mt-3">
		<h5>Consulta de tarefas</h5>
		<p>Informe o nome da tarefa desejada para realizar a consulta.</p>
		<hr>
	</div>

	<form action="consultar-tarefas" method="post">
		<div class="row">
			<div class="col-md-3">
				<label>Nome da Tarefa:</label> 
				<form:input path="model.nome" type="text" id="nome" name="nome" class="form-control" placeholder="Digite aqui" />
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<input type="submit" value="Pesquisar tarefa"
					class="btn btn-success" />
			</div>
		</div>
	</form>

<c:if test="${tarefas.size() > 0}">

	<table class="table table-hover table-sm mt-3">
		<thead>
			<tr>
				<th>Nome da tarefa</th>
				<th>Data</th>
				<th>Hora</th>
				<th>Prioridade</th>
				<th>Descri��o</th>
				<th>Opera��es</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${tarefas}" var="t">
			<tr>
				<td>${t.nome }</td>
				<td><fmt:formatDate value="${t.data}" pattern="dd/MM/yyyy"/></td>
				<td>${t.hora}</td>
					<td>
						<c:if test="${t.prioridade == 1}">
							<span class="badge bg-danger">ALTA</span>
						</c:if>
						<c:if test="${t.prioridade == 2}">
							<span class="badge bg-warning">M�DIA</span>
						</c:if>
						<c:if test="${t.prioridade == 3}">
							<span class="badge bg-success">BAIXA</span>
						</c:if>
					</td>			
				<td>${t.descricao}</td>
				<td>
				<a href="/agendaweb/tarefas-edicao?id=${t.idTarefa}" class="btn btn-primary btn-sm">Editar</a> 
				<a href="/agendaweb/excluirtarefa?idTarefa=${t.idTarefa}" class="btn btn-danger btn-sm" onclick="return confirm('Deseja excluir a tarefa selecionada?')">Ecluir</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td class="6">
					Quantidade de registros: ${tarefas.size()}
				</td>
			</tr>
		</tfoot>

	</table>

</c:if>


	<!-- arquivos de extens�o javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>