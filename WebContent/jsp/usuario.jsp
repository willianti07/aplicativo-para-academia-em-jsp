<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%@page import="java.sql.Connection"%>
    <%@page import="com.mysql.jdbc.Statement"%>
    <%@page import="java.sql.ResultSet"%>
    <%
     if(session.getAttribute("login_empresa") == null){
        	 response.sendRedirect("../index.jsp"); 
         }
        	 String login_logado = session.getAttribute("login_empresa").toString();

     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>historico</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/css.css">
	<link rel="stylesheet" type="text/css" href="../css/historico.css">
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
			<div class="menu_home"><img src="../imagens/login_icone.png"><% out.print(session. getAttribute("login_empresa"));%>
				<ul class="esconde">
					<li ><a href="Historico.html"><b>Historico</b></a></li>
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
	<div class="historico">
	<h2>Lista de usuarios</h2>
	<div class="historico_peso">
	<%
	String cpf = "";
	String sql = "";
	Connection conn = ConexaoBanco.abrir();
	sql += "select nome,login from usuario where empresa_filiada = "+"'"+login_logado+"'";
	Statement st = (Statement) conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	double total = 0;
	int contagen = 0;
	while(rs.next()) {
	%>
		<form  method="post"  action="Usuarios_empresa.jsp">
		<b><%out.print("  Usuario -------- "+rs.getString("nome"));%></b>
		<input type="hidden" class = "btn btn-primário  campo" name="login" value="<%out.print(rs.getString("login"));%>">
		<input type="submit" class = "btn btn-primário  campo" nome="enviar" value="serie">
		<hr>
		</form>
		<%
	}
	%>
	
	</div>
	</div>
</body>
</html>