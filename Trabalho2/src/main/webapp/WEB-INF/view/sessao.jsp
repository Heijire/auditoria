<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Sessão</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/estilo.css" />
</head>
<body>
	<!-- Navegação -->
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link" aria-current="page"
			href="index.jsp">TELA INICIAL</a></li>
		<li class="nav-item"><a class="nav-link active" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>
	<br />

	<div class="container">
		<h2 class="mb-4 text-center">SESSÃO</h2>
		<form action="salvar" method="post" class="mb-4">
			<input type="hidden" name="idSessao"
				value="${sessao != null ? sessao.idSessao : ''}" />

			<div class="mb-3">
				<label for="usuario" class="form-label">Nome de Usuário:</label> <input
					type="text" class="form-control" id="usuario" name="usuario"
					placeholder="Digite o nome do usuário"
					value="${sessao != null ? sessao.usuario : ''}" required />
			</div>

			<div class="mb-3">
				<label for="ip" class="form-label">IP:</label> <input type="text"
					class="form-control" id="ip" name="ip" placeholder="Digite o IP"
					value="${sessao != null ? sessao.ip : ''}" required />
			</div>

			<button type="submit" class="btn custom-btn">Salvar</button>
		</form>
		<form action="sessao/buscar" method="get"
			class="mb-3 d-flex justify-content-center gap-2">
			<input type="text" name="ip" class="form-control"
				placeholder="Buscar por IP"
				value="${filtroIp != null ? filtroIp : ''}" />
			<button type="submit" class="custom-btn">Procurar</button>
		</form>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Usuário</th>
					<th>Ip</th>
					<th>Botão</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${sessoes}">
					<tr>
						<td>${s.idSessao}</td>
						<td>${s.usuario}</td>
						<td>${s.ip}</td>
						<td><a href="editar?id=${s.idSessao}" class="btn custom-btn">Editar</a>
							<a href="deletar?id=${s.idSessao}" class="btn custom-btn"
							onclick="return confirm('Confirma exclusão?');">Excluir</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
