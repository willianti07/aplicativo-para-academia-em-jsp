<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="conexao.ConexaoBanco" %>
     <%
     if(session.getAttribute("login") == null){
        	 response.sendRedirect("../index.jsp"); 
         }
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/css.css">
	<link rel="stylesheet" type="text/css" href="../css/css_home.css">
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
			<li><a href="#"><img src="../imagens/home.png"><b>Home</b></a></li>
			<li><a href="contatos.jsp"><img src="../imagens/contatos.png"><b>Contatos</b></a></li>
			<div class="menu_home"><img src="../imagens/login_icone.png"><% out.print(session. getAttribute("login"));%>
				<ul class="esconde">
					<li ><a href="historico.jsp"><b>Historico</b></a></li>
					<hr/>
					<li ><a href="lembrete.jsp"><b>Lembrete</b></a></li>
					<hr/>
					<li ><a href="perfil.jsp"><b>Perfil</b></a></li>
					<hr/>
					<li ><a href="Series.jsp"><b>Series</b></a></li>
					<hr/>
					<li><a href="sair.jsp"><b>Sair</b></a></li>
				<ul>
			</div>
		</ul>
	</div>

<div class="resumo">
<canvas id="resumo_mensal" width="400" height="300"></canvas>
<script>
var ctx = document.getElementById("resumo_mensal").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"],
        datasets: [{
            label: 'Media',
            data: [<% out.print(ConexaoBanco.Retorna_janeiro(session.getAttribute("login").toString()));%> , <% out.print(ConexaoBanco.Retorna_fevereiro(session.getAttribute("login").toString()));%>, <% out.print(ConexaoBanco.Retorna_marco(session.getAttribute("login").toString()));%>, <% out.print(ConexaoBanco.Retorna_abril(session.getAttribute("login").toString()));%>, <% out.print(ConexaoBanco.Retorna_maio(session.getAttribute("login").toString()));%>, <% out.print(ConexaoBanco.Retorna_junho(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_julho(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_agosto(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_setembro(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_outubro(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_novembro(session.getAttribute("login").toString()));%>,<% out.print(ConexaoBanco.Retorna_dezembro(session.getAttribute("login").toString()));%>],
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

<div class="agenda">
<div class="agenda_interna">
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
var day_of_week = new Array('Dom','Seg','Ter','Qua','Qui','Sex','Sab');
var month_of_year = new Array('Janeiro','Fevereiro','MarÃ§o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
 
var Calendar = new Date();
 
var year = Calendar.getFullYear();       // Retorna o ano
var month = Calendar.getMonth();    // Retorna mes (0-11)
var today = Calendar.getDate();     // Retorna dias (1-31)
var weekday = Calendar.getDay();   // Retorna dias (1-31)
 
var DAYS_OF_WEEK = 7;    // "constant" para o numero de dias na semana
var DAYS_OF_MONTH = 31;    // "constant" para o numero de dias no mes
var cal;    // Usado para imprimir na tela
 
Calendar.setDate(1);    // Comecar o calendario no dia '1'
Calendar.setMonth(month);    // Comecar o calendario com o mes atual
 
 
var TR_start = '<TR>';
var TR_end = '</TR>';
var highlight_start = '<TD WIDTH="30"><TABLE CELLSPACING=0 BGCOLOR=gray><TR><TD WIDTH=20><B><CENTER>';
var highlight_end   = '</CENTER></TD></TR></TABLE></B>';
var TD_start = '<TD WIDTH="30"><CENTER>';
var TD_end = '</CENTER></TD>';
 
cal =  '<TABLE CELLSPACING=0 CELLPADDING=0><TR><TD>';
cal += '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=2>' + TR_start;
cal += '<TD COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="gray"><CENTER><B>';
cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
cal += TR_start;
 
for(index=0; index < DAYS_OF_WEEK; index++)
{
 
if(weekday == index)
cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;
else
cal += TD_start + day_of_week[index] + TD_end;
}
 
cal += TD_end + TR_end;
cal += TR_start;
 
for(index=0; index < Calendar.getDay(); index++)
cal += TD_start + '  ' + TD_end;
 
for(index=0; index < DAYS_OF_MONTH; index++)
{
if( Calendar.getDate() > index )
{
  week_day =Calendar.getDay();
  if(week_day == 0)
  cal += TR_start;
  if(week_day != DAYS_OF_WEEK)
  {
  var day  = Calendar.getDate();
  if( today==Calendar.getDate() )
  cal += highlight_start + day + highlight_end + TD_end;
  else
  cal += TD_start + day + TD_end;
  }
  if(week_day == DAYS_OF_WEEK)
  cal += TR_end;
  }
  Calendar.setDate(Calendar.getDate()+1);
}
cal += '</TD></TR></TABLE></TABLE>';
 
//  MOSTRAR CALENDARIO
document.write(cal);
//  End -->
</SCRIPT>

</div>
<div class="lembrete_home">
	<h4 class="titulo_lembrete">Lembretes</h4>
	<div class="mensagen_lembrete"><H5><% out.print(ConexaoBanco.retorna_lembrete(session.getAttribute("login").toString()));%></H5></div>
	
	
</div>

<div class="lembrete">
	<div class="mensagen_lembrete_empresa"><H6><% out.print(ConexaoBanco.retorna_lembrete_empresa());%></H6></div>
</div>
</div>

	</body>
</html>