<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
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
	<div class="container text-center">
		<h1>Tela Inicial</h1>
		<br/>
		<h2>Escolha qual dos cruds você deseja utilizar.</h2> 
		<br/>
		<div class="d-grid gap-2 col-6 mx-auto" role="group" aria-label="Basic outlined example">
	<button type="submit" class="btn custom-btn" onclick="window.location.href='sessao.jsp'">SESSAO</button>
	<button type="submit" class="btn custom-btn" onclick="window.location.href='log.jsp'">LOG</button>
	<button type="submit" class="btn custom-btn" onclick="window.location.href='requisissao.jsp'">REQUISICAO</button>
	<button type="submit" class="btn custom-btn" onclick="window.location.href='pagina.jsp'">PAGINA</button>
	<button type="submit" class="btn custom-btn" onclick="window.location.href='link.jsp'">LINK</button>
</div>

	</div>

</body>
</html>