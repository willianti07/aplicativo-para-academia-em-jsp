<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%@page import="system.funcoes_sistema" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>salva historico</title>
</head>
<body>
<%
String peso = request.getParameter("peso"); 
String login_logado = session.getAttribute("login").toString();
String data_inicial = funcoes_sistema.getDateTime();
ConexaoBanco.salva_historico(peso, login_logado, data_inicial);
%>
<script type="text/javascript">
alert('salvo com sucesso');
window.location = 'historico.jsp';
</script>
</body>
</html>