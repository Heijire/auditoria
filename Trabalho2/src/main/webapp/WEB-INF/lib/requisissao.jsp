<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REQUISIÇÃO</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="./css/estilo.css">
</head>
<body>
	<!-- Navegação -->
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link" href="index.jsp">TELA
				INICIAL</a></li>
		<li class="nav-item"><a class="nav-link" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>
	<br />

	<div class="container mt-5">
		<h2 class="text-center mb-4">Cadastro de Requisicao</h2>
		<form action="/requisicoes/salvar" method="post">
			<input type="hidden" name="idRequisicao"
				value="${requisicao.idRequisicao}" />

			<div class="mb-3">
				<input type="text" name="tempo" placeholder="Tempo (ms)"
					class="form-control" value="${requisicao.tempo}" required />
			</div>
			<div class="mb-3">
				<input type="text" name="codigoHttp" placeholder="Código HTTP"
					class="form-control" value="${requisicao.codigoHttp}" required />
			</div>
			<div class="mb-3">
				<input type="text" name="sessao.idSessao" placeholder="ID da Sessão"
					class="form-control" value="${requisicao.sessao.idSessao}" required />
			</div>
			<div class="mb-3">
				<input type="text" name="pagina.idPagina" placeholder="ID da Pagina"
					class="form-control" value="${requisicao.pagina.idPagina}" required />
			</div>
			<div class="d-flex justify-content-between flex-wrap gap-2">
				<button type="submit" class="btn custom-btn">Adicionar</button>
				<a href="/requisicoes" class="btn custom-btn">Buscar</a>
			</div>
		</form>
	</div>
	<hr />
	<form class="row g-3 mb-4" action="/requisicoes/buscarTempo"
		method="get">
		<div class="col-auto">
			<input type="number" name="tempo"
				placeholder="Buscar requisições com tempo <" class="form-control"
				required />
		</div>
		<div class="col-auto">
			<button type="submit" class="btn custom-btn">Buscar por
				Tempo</button>
		</div>
	</form>

	<form class="row g-3 mb-4" action="/requisicoes/buscarUsuario"
		method="get">
		<div class="col-auto">
			<input type="text" name="usuario"
				placeholder="Buscar requisições por usuário" class="form-control"
				required />
		</div>
		<div class="col-auto">
			<button type="submit" class="btn custom-btn">Buscar por
				Usuário</button>
		</div>
	</form>
	<c:if test="${not empty requisicoes}">
		<div class="container mt-4">
			<h4 class="text-center mb-3">Requisições Registradas</h4>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Tempo</th>
						<th>Código HTTP</th>
						<th>ID Sessão</th>
						<th>ID pagina</th>
						<th>Acao</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="r" items="${requisicoes}">
						<tr>
							<td>${r.idRequisissao}</td>
							<td>${r.tempo}</td>
							<td>${r.codigoHttp}</td>
							<td>${r.sessao.idSessao}</td>
							<td>${r.pagina.idPagina}</td>
							
							<td><a
								href="/requisicoes/editar?id=${r.idRequisissao}"
								class="btn custom-btn">Editar</a> <a
								href="/requisicoes/deletar?id=${r.idRequisissao}"
								class="btn custom-btn"
								onclick="return confirm('Confirma exclusão da requisicao?');">Deletar</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
</body>
</html>
