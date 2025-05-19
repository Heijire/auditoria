<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Logs</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="./css/estilo.css">
</head>
<body>

	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link " href="index.jsp">TELA INICIAL</a></li>
		<li class="nav-item"><a class="nav-link" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link active"  aria-current="page" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>

<div class="container mt-4">
	<h2 class="text-center">Gerenciamento de Logs</h2>

	<form action="/logs/buscar" method="get" class="row g-3 mb-4">
		<div class="col-auto">
			<input type="text" name="ip" class="form-control" placeholder="Buscar por IP" value="${filtroIp}">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn custom-btn">Buscar</button>
			<a href="/logs" class="btn custom-btn">Limpar</a>
		</div>
	</form>

	<form action="/logs/salvar" method="post" class="border p-4 rounded bg-light mb-4">
		<input type="hidden" name="idLogs" value="${log.idLogs}">

		<div class="mb-3">
			<label for="mensagens" class="form-label">Mensagem:</label>
			<input type="text" class="form-control" id="mensagens" name="mensagens" value="${log.mensagens}" required>
		</div>

		<div class="mb-3">
			<label for="sessao" class="form-label">ID da Sessão:</label>
			<input type="number" class="form-control" id="sessao" name="sessao.idSessao" value="${log.sessao.idSessao}" required>
		</div>

		<button type="submit" class="btn custom-btn">Salvar</button>
	</form>

	<table class="table table-bordered table-striped">
		<thead class="table-dark">
			<tr>
				<th>ID</th>
				<th>Mensagem</th>
				<th>ID Sessão</th>
				<th>Ações</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${logs}">
				<tr>
					<td>${l.idLogs}</td>
					<td>${l.mensagens}</td>
					<td>${l.sessao.idSessao}</td>
					<td>
						<a href="/logs/editar?id=${l.idLogs}" class="btn custom-btn">Editar</a>
						<a href="/logs/deletar?id=${l.idLogs}" class="btn custom-btn" onclick="return confirm('Deseja realmente deletar?')">Excluir</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>
