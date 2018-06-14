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
<title>atualiza</title>
</head>
<body>
<% 
String nome = request.getParameter("nome");
String sobrenome = request.getParameter("sobrenome");
String cpf = request.getParameter("cpf");
String altura = request.getParameter("altura");
String empresa_filiada = request.getParameter("empresa_filiada");
String email = request.getParameter("email");
ConexaoBanco.atualiza_usuario(nome, sobrenome, cpf, email, empresa_filiada, altura);
response.sendRedirect("perfil.jsp"); 
%>
</body>
</html>