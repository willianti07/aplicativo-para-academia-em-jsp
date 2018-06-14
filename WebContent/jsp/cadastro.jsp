<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
     if(session. getAttribute("login") != null){
        	 response.sendRedirect("../index.jsp"); 
         }
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro</title>
<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/css.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body id="login">
			<div class="menu">
		<ul>
			<li><a href="index.jsp"><img src="../imagens/home.png"><b>Home</b></a></li>
			<li><a href="../index.jsp"><img src="../imagens/login.png"><b>Login</b></a></li>
			<li><a href="contatos.jsp"><img src="../imagens/contatos.png"><b>Contatos</b></a></li>
		</ul>
	</div>
	<div class="area_cadastro">
	<form method="post" class="formulario" action="cadastra_usuario.jsp">
		<h1><b>Physical Size</b></h1>
		<input type="text" class="campos login" name="nome" placeholder="digite seu nome" required="true">
		<input type="text" class="campos login" name="sobrenome" placeholder="digite seu sobrenome" required="true">
		<input type="text" class="campos login" name="cpf" placeholder="digite seu cpf" required="true" maxlength="11">
		<input type="email" class="campos email" name="email" placeholder="digite seu email" required="true">
		<input type="text" class="campos login" name="Login" placeholder="digite seu Login" required="true">
		<input type="text" class="campos login" name="empresa_filiada" placeholder="digite seu empresa conveniada" required="true">
		<input type="number" class="campos login" name="peso" placeholder="digite seu peso" required="true" maxlength="5">
		<input type="number" class="campos login" name="altura" placeholder="digite sua altura" required="true" maxlength="3">
		<input type="password" class="campos senha" name="senha" placeholder="digite sua senha" required="true">
		<a href="../index.jsp"><input type="button" name="Voltar" value="Voltar" class = "btn btn-primário"></a>
		<input type="submit" name="cadastrar" value="cadastrar" class = "btn btn-primário">
	</form>
	</div>
</body>
</html>