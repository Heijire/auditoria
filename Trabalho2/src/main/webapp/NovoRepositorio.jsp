<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/estilo.css">
<title>Trabalho Engenharia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
  <!-- Barra de navegação -->
  <div class="navbar">
    <div class="logo">GitHub</div>
    <div class="search-bar">
      <input type="text" placeholder="Pesquisar no SUPER MEGA SOFTWARE BLASTER...">
    </div>
    <a href="#" class="login-btn">Login</a>
  </div>

  <!-- Sidebar -->
  <div class="sidebar">
    <a href="#">Projetos</a>
    <a href="#">Novo Projeto</a>	
    <a href="#">Colaboradores</a>
  </div>

  <!-- Conteúdo principal -->
  <div class="content">
    <div class="title"></div>

    <div class="repo-form">
  <h2>Adicionar Novo Repositório</h2>
  <input type="text" id="repoName" placeholder="Nome do Repositório" style="width: 100%; padding: 10px; margin-bottom: 10px;">
  <textarea id="repoDescription" placeholder="Descrição do Repositório" style="width: 100%; padding: 10px; margin-bottom: 10px;"></textarea>
  <button onclick="addRepo()" style="padding: 10px 20px; background-color: #2c974b; color: white; border: none; border-radius: 5px;">Adicionar</button>

  <!-- Botão para subir uma pasta -->
  <h3 style="margin-top: 20px;">Enviar Arquivos</h3>
  <input type="file" id="folderUpload" webkitdirectory directory multiple style="margin-top: 10px;">
</div>


    
  </div>
</body>
</html>
