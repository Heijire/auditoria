<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"%>
	<title>requisissao</title>
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
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="index.jsp">TELA INICIAL</a></li>
		<li class="nav-item"><a class="nav-link" href="sessao.jsp">SESSAO</a></li>
		<li class="nav-item"><a class="nav-link" href="log.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>
	<br />
		<div class="form-container text-center">
		<h2 class="mb-4">SESSAO</h2>
		<form>
		
		
		
		
			<div class="d-flex justify-content-between flex-wrap gap-2">
				<button type="submit" class="btn custom-btn">Adicionar</button>
				<button type="button" class="btn custom-btn">Buscar</button>
				<button type="button" class="btn custom-btn">Atualiza</button>
				<button type="button" class="btn custom-btn">Remove</button>
			</div>
		</form>
	</div>
</body>
</html>