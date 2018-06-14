<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="conexao.ConexaoBanco" %>
      <%
     if(session.getAttribute("login_empresa") == null){
        	 response.sendRedirect("../index.jsp"); 
         }
     
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Empresa</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/css.css">
	<link rel="stylesheet" type="text/css" href="../css/empresa.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
</head>
<body id="home">
		<div class="menu">
		<ul>
			<li><a href="home.jsp"><img src="../imagens/home.png"><b>Home</b></a></li>
			<li><a href="contatos.jsp"><img src="../imagens/contatos.png"><b>Contatos</b></a></li>
			<div class="menu_home"><img src="../imagens/login_icone.png"><% out.print(session. getAttribute("login_empresa"));%>
				<ul class="esconde">
					<li ><a href="usuario.jsp"><b>Usuarios</b></a></li>
					<hr/>
					<li><a href="sair.jsp"><b>Sair</b></a></li>
				<ul>
			</div>
		</ul>
	</div>
	<div class="acompanhamento">
	<div class="numero_usuarios">
	<canvas id="resumo_mensal" width="400" height="300"></canvas>
	<script>
	var ctx = document.getElementById("resumo_mensal").getContext('2d');
	var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"],
        datasets: [{
            label: 'Media usuario',
            data: [<% out.print(ConexaoBanco.Retorna_janeiro_usuario(session.getAttribute("login_empresa").toString()));%> , <% out.print(ConexaoBanco.Retorna_fevereiro_usuario(session.getAttribute("login_empresa").toString()));%>, <% out.print(ConexaoBanco.Retorna_marco_usuario(session.getAttribute("login_empresa").toString()));%>, <% out.print(ConexaoBanco.Retorna_abril_usuario(session.getAttribute("login_empresa").toString()));%>, <% out.print(ConexaoBanco.Retorna_maio_usuario(session.getAttribute("login_empresa").toString()));%>, <% out.print(ConexaoBanco.Retorna_junho_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_julho_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_agosto_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_setembro_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_outubro_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_novembro_usuario(session.getAttribute("login_empresa").toString()));%>,<% out.print(ConexaoBanco.Retorna_dezembro_usuario(session.getAttribute("login_empresa").toString()));%>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                 'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
</div>
<div class="area_login">
	<form method="post" class="formulario" action="lembrete_salva_ empresa.jsp">
		<h1><b>Lembretes</b></h1>
		<input type="date" class="campos data" name="data" required="true">
		<textarea type="text"  class="campos texto" name="msg" required="true" maxlength="60"></textarea>
		<input type="submit" name="salvar" value="salvar" class = "btn btn-primário">
		<a href="home.jsp"><input type="button" name="voltar" value="voltar" class = "btn btn-primário"></a>
	</form>
	</form>
</div>
	</div>
</body>
</html>