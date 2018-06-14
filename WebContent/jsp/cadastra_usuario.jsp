<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%@page import="system.funcoes_sistema" %>
    <%
     if(session. getAttribute("login") != null){
        	 response.sendRedirect("../index.jsp"); 
         }
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String nome = request.getParameter("nome");
String sobrenome = request.getParameter("sobrenome");
String cpf = request.getParameter("cpf");
String login = request.getParameter("Login");
String senha = request.getParameter("senha");
String peso = request.getParameter("peso"); 
String altura = request.getParameter("altura");
String empresa_filiada = request.getParameter("empresa_filiada");
String data_inicial = funcoes_sistema.getDateTime();
String email = request.getParameter("email");

if(ConexaoBanco.Salvar(nome, sobrenome, cpf, login, senha, Double.parseDouble(peso), Double.parseDouble(altura), empresa_filiada, data_inicial,email) == true){ %>
<script language= "JavaScript">
	alert('cadastro efetuado com sucesso');
	window.location = '../index.jsp';
</script>
<% }else{%>
<script language= "JavaScript">
	alert('erro ao cadastrar');
	window.location = '../cadastro.jsp';
</script>
<% }%>
</body>
</html>