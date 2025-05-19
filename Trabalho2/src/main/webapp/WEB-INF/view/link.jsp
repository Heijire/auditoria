<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Link</title>
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
		<li class="nav-item"><a class="nav-link" href="index.jsp">TELA
				INICIAL</a></li>
		<li class="nav-item"><a class="nav-link" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link active" href="link.jsp">LINK</a></li>
	</ul>
	<br />

	<div class="container">
		<h2 class="mb-4 text-center">LINK</h2>

		<form action="link/salvar" method="post" class="mb-4">
			<input type="hidden" name="idLink"
				value="${link != null ? link.idLink : ''}" />

			<div class="mb-3">
				<label for="destino" class="form-label">Destino:</label> <input
					type="text" class="form-control" id="destino" name="destino"
					placeholder="Digite o destino"
					value="${link != null ? link.destino : ''}" required />
			</div>

			<div class="mb-3">
				<label for="titulo" class="form-label">Título:</label> <input
					type="text" class="form-control" id="titulo" name="titulo"
					placeholder="Digite o título"
					value="${link != null ? link.titulo : ''}" required />
			</div>

			<div class="mb-3">
				<label for="target" class="form-label">Target:</label> <select
					class="form-select" id="target" name="target" required>
					<option value="" disabled<c:if
							test="${empty link or empty link.target}">selected</c:if>>Selecione
						o target
					</option>
					<option value="_blank"<c:if
							test="${link.target == '_blank'}">selected</c:if>>_blank
					</option>
					<option value="_self"<c:if
							test="${link.target == '_self'}">selected</c:if>>_self
					</option>
					<option value="_parent"<c:if
							test="${link.target == '_parent'}">selected</c:if>>_parent
					</option>
					<option value="_top"<c:if test="${link.target == '_top'}">selected</c:if>>_top
					</option>
				</select>
				<div class="form-text">Targets válidos que iniciam com
					underline (_).</div>
			</div>

			<div class="mb-3">
				<label for="paginas" class="form-label">Páginas:</label> <select
					multiple class="form-select" id="paginas" name="paginas[]">

					<c:forEach var="p" items="${todasPaginas}">
						<option value="${p.idPagina}"<c:if
								test="${not empty paginasAsString and fn:contains(paginasAsString, p.idPagina)}">selected</c:if>>
							${p.url}
						</option>
					</c:forEach>
				</select>
				<div class="form-text">Segure Ctrl para selecionar várias
					páginas.</div>
			</div>

			<button type="submit" class="custom-btn">Salvar</button>
		</form>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Destino</th>
					<th>Target</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${links}">
					<tr>
						<td>${l.idLink}</td>
						<td>${l.destino}</td>
						<td>${l.target}</td>
						<td><a href="link/editar?id=${l.idLink}"
							class="btn custom-btn">Editar</a> <a
							href="link/deletar?id=${l.idLink}" class="btn custom-btn"
							onclick="return confirm('Confirma exclusão?');">Excluir</a> <a
							href="link/quantidade?id=${l.idLink}" class="btn custom-btn">Qtd.
								Páginas</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
