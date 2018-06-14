<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%
     if(session. getAttribute("login") == null){
        	 response.sendRedirect("../index.jsp"); 
         }
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>salva lembrete</title>
</head>
<body>
<%
String data_agenda = request.getParameter("data");
String msg = request.getParameter("msg");
String login = session.getAttribute("login").toString();

if(ConexaoBanco.cadastra_agenda(data_agenda, msg, login) == true){%>
<script language= "JavaScript">
	alert('cadastro efetuado com sucesso');
	window.location = 'lembrete.jsp';
</script>
<%}else{%>
	<script language= "JavaScript">
	alert('erro ao salvar lembrete');
	window.location = 'lembrete.jsp';
</script>
<%}%>

%>
</body>
</html>