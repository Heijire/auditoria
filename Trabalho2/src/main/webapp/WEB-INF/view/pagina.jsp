<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página</title>
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
<link rel="stylesheet" href="./css/estilo.css">
</head>
<body>
	<!-- Navegação -->
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link" 
			href="index.jsp">TELA INICIAL</a></li>
		<li class="nav-item"><a class="nav-link" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link active"aria-current="page" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>

	<div class="container mt-5">
		<h2 class="text-center mb-4">Cadastro de Página</h2>

		<!-- Mensagens de sucesso/erro -->
		<c:if test="${not empty saida}">
			<div class="alert alert-success">${saida}</div>
		</c:if>
		<c:if test="${not empty erro}">
			<div class="alert alert-danger">${erro}</div>
		</c:if>

		<!-- Formulário para salvar ou editar -->
		<form action="pagina/salvar" method="post">
			<!-- Campo oculto para id da página (útil para edição) -->
			<input type="hidden" name="idPagina" value="${pagina.idPagina}" />

			<div class="mb-3">
				<label for="html" class="form-label">Código HTML:</label>
				<textarea class="form-control" id="html" name="html" rows="5"
					maxlength="1048576" required>${pagina.html}</textarea>
			</div>

			<div class="mb-3">
				<label for="tipo" class="form-label">Tipo de Conteúdo:</label> <input
					type="text" class="form-control" id="tipo" name="tipo"
					maxlength="50" required value="${pagina.tipo}" />
			</div>

			<div class="mb-3">
				<label for="titulo" class="form-label">Título:</label> <input
					type="text" class="form-control" id="titulo" name="titulo"
					maxlength="50" required value="${pagina.titulo}" />
			</div>

			<div class="mb-3">
				<label for="url" class="form-label">URL:</label> <input type="url"
					class="form-control" id="url" name="url" maxlength="50" required
					value="${pagina.url}" />
			</div>

			<div class="mb-3">
				<label for="tamanho" class="form-label">Tamanho (bytes):</label> <input
					type="number" class="form-control" id="tamanho" name="tamanho"
					required min="0" max="1048576" value="${pagina.tamanho}" />
				<div class="form-text">O tamanho máximo permitido é 1 MB
					(1048576 bytes).</div>
			</div>

			<button type="submit" class="btn custom-btn">Salvar</button>
			<a href="pagina" class="btn custom-btn">Cancelar</a>
		</form>

		<hr />

		<form class="row g-3 mb-4" action="pagina/buscar" method="get">
			<div class="col-auto">
				<input type="text" name="url" class="form-control"
					placeholder="Buscar por URL" value="${filtroUrl}" />
			</div>
			<div class="col-auto">
				<button type="submit" class="btn custom-btn">Buscar</button>
				<a href="pagina" class="btn custom-btn">Limpar</a>
			</div>
		</form>
		<form class="row g-3 mb-4" action="pagina/buscarTamanho"
			method="get">
			<div class="col-auto">
				<input type="number" name="tamanho" class="form-control"
					placeholder="Buscar por Tamanho (bytes)" min="0" max="1048576" required />
			</div>
			<div class="col-auto">
				<button type="submit" class="btn custom-btn">Buscar por
					Tamanho</button>
			</div>
		</form>
		<!-- Lista de páginas -->
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Título</th>
					<th>URL</th>
					<th>Tipo</th>
					<th>Tamanho (bytes)</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${paginas}">
					<tr>
						<td>${p.idPagina}</td>
						<td>${p.titulo}</td>
						<td>${p.url}</td>
						<td>${p.tipo}</td>
						<td>${p.tamanho}</td>
						<td><a href="pagina/editar?id=${p.idPagina}"
							class="btn custom-btn">Editar</a> <a
							href="pagina/deletar?id=${p.idPagina}" class="btn custom-btn"
							onclick="return confirm('Confirma exclusão da página?');">Deletar</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>
