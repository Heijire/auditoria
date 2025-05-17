<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"%>
	<title>pagina</title>
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
		<li class="nav-item"><a class="nav-link" href="loo.jsp">LOG</a></li>
		<li class="nav-item"><a class="nav-link" href="requisissao.jsp">REQUISICAO</a></li>
		<li class="nav-item"><a class="nav-link" href="pagina.jsp">PAGINA</a></li>
		<li class="nav-item"><a class="nav-link" href="link.jsp">LINK</a></li>
	</ul>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Cadastro de Página</h2>
        <form action="paginaServlet" method="post">
            <div class="mb-3">
                <label for="codigoHTML" class="form-label">Código HTML:</label>
                <textarea class="form-control" id="html" name="html"  ></textarea>
                <div class="form-text">Código HTML da página (tamanho máximo 1MB).</div>
            </div>

            <div class="mb-3">
                <label for="tipoConteudo" class="form-label">Tipo de Conteúdo:</label>
                <input type="text" class="form-control" id="tipo" name="tipo" maxlength="50" required />
            </div>

            <div class="mb-3">
                <label for="titulo" class="form-label">Título:</label>
                <input type="text" class="form-control" id="titulo" name="titulo" maxlength="50" required />
            </div>

            <div class="mb-3">
                <label for="url" class="form-label">URL:</label>
                <input type="url" class="form-control" id="url" name="url" maxlength="50" required />
            </div>

            <div class="mb-3">
                <label for="tamanho" class="form-label">Tamanho (bytes):</label>
                <input type="number" class="form-control" id="tamanho" name="tamanho" >
                <div class="form-text">O tamanho máximo permitido é 1 MB (1048576 bytes).</div>
            </div>

        </form>
    </div>
	
</body>
</html>