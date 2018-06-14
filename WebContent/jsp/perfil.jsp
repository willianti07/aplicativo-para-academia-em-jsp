<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%
     if(session. getAttribute("login") == null){
        	 response.sendRedirect("../index.jsp"); 
         }
    
    String login_logado = session. getAttribute("login").toString();
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>perfil</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/css.css">
	<link rel="stylesheet" type="text/css" href="../css/perfil.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body id="home">
		<div class="menu">
		<ul>
			<li><a href="home.jsp"><img src="../imagens/home.png"><b>Home</b></a></li>
			<li><a href="contatos.jsp"><img src="../imagens/contatos.png"><b>Contatos</b></a></li>
			<div class="menu_home"><img src="../imagens/login_icone.png"><% out.print(session. getAttribute("login"));%>
				<ul class="esconde">
					<li ><a href="historico.jsp"><b>Historico</b></a></li>
					<hr/>
					<li ><a href="lembrete.jsp"><b>Lembrete</b></a></li>
					<hr/>
					<li ><a href="Perfil.html"><b>Perfil</b></a></li>
					<hr/>
					<li ><a href="Series.jsp"><b>Series</b></a></li>
					<hr/>
					<li><a href="sair.jsp"><b>Sair</b></a></li>
				<ul>
			</div>
		</ul>
	</div>
	<div class="perfil">
	<form method="post" class="formulario" action="atualiza_usuario.jsp">
		<h1><b>Physical Size</b></h1>
		<input type="text" class="campos login" name="nome" placeholder="nome" value="<%out.print(ConexaoBanco.retorna_nome(login_logado));%>" required="true">
		<input type="text" class="campos login" name="sobrenome" placeholder="sobrenome"  value="<%out.print(ConexaoBanco.retorna_sobrenome(login_logado));%>" required="true">
		<input type="text" class="campos login" name="cpf" placeholder="cpf" value="<%out.print(ConexaoBanco.retorna_cpf(login_logado));%>" required="true" maxlength="11">
		<input type="email" class="campos email" name="email" placeholder="email" value="<%out.print(ConexaoBanco.retorna_email(login_logado));%>" required="true">
		<input type="text" class="campos login" name="empresa_filiada" placeholder="empresa_filiada" value="<%out.print(ConexaoBanco.retorna_empresa_filiada(login_logado));%>" required="true">
		<input type="text" class="campos login" name="altura"  required="true" placeholder="altura" value="<%out.print(ConexaoBanco.retorna_altura(login_logado));%>" maxlength="3">
		<a href="home.jsp"><input type="button" name="Home" value="inicio"  class = "btn btn-primário botao"></a>
		<input type="submit" name="atualizar" value="atualizar" class = "btn btn-primário botao">
	</form>
	
	</div>

</body>
</html>