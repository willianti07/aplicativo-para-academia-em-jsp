<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="conexao.ConexaoBanco" %>
    <%@page import="javax.swing.JOptionPane" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>verifica</title>
</head>
<body>
<% String login = request.getParameter("Login");
String senha = request.getParameter("senha");

boolean status = ConexaoBanco.valida(login, senha);
if(status == true){
	HttpSession sessao = request.getSession();
	session.setAttribute("login", login);
	response.sendRedirect("home.jsp"); 
}else{
	response.sendRedirect("../index.jsp"); 
}
%>
</body>
</html>