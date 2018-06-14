<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Contatos</title>
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
			<li><a href="home.jsp"><img src="../imagens/home.png"><b>Home</b></a></li>
			<%if(session. getAttribute("login") == null){%>
			<li><a href="../index.jsp"><img src="../imagens/login.png"><b>Login</b></a></li>
			<% 
         }
     %>
			<li><a href="contatos.jsp"><img src="../imagens/contatos.png"><b>Contatos</b></a></li>
			<%
     if(session. getAttribute("login") != null){%>
        	
			<div class="menu_home"><img src="../imagens/login_icone.png"><% out.print(session. getAttribute("login"));%>
				<ul class="esconde">
					<li ><a href="historico.jsp"><b>Historico</b></a></li>
					<hr/>
					<li ><a href="lembrete.jsp"><b>Lembrete</b></a></li>
					<hr/>
					<li ><a href="Perfil.jsp"><b>Perfil</b></a></li>
					<hr/>
					<li ><a href="Series.jsp"><b>Series</b></a></li>
					<hr/>
					<li><a href="sair.jsp"><b>Sair</b></a></li>
				<ul>
			</div>
			<% 
         }
     %>
		</ul>
	</div>
	<div class="area_contatos">
		<div class="contatos">
		<h2 ><b>Contatos</b></h2>
		<h2 ><b>Endereço Fisico</b></h2>
		<h3><img src="../imagens/endereco.png"><b>Av. Gonçalo Ferreira  </b></h4>
		<h3><b>N° 40 Qd 10 Bl 2 Apt 207</b></h4>
		<h3><b>Curado II</b></h4>
		<h3><b>Jaboatão dos Guararapes-Pe</b></h4>
		</div>

	</div>
	<div class="area_contatos2">
		<div class="contatos">
		<h2 align="center"><b>Contatos</b></h2>
		<h3><img src="../imagens/email.png"><b>PhysicalSize@hotmail.com</b></h3>
		<h3 align="left"><img src="../imagens/contatos.png" ><b>(81)984215665 \ OI</b></h3>
		<h3 align="left"><img src="../imagens/contatos.png" ><b>(81)996005784 \ TIM</b></h3>
		</div>

	</div>
</body>
</html>