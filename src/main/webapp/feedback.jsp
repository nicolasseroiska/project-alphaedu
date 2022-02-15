<!-- Nicolas Seroiska - ht1910213 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Usuario"%>
<%@page import="controller.UsuarioController"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Status</title>
	</head>
	
	<body>
		
		<h1> Feedback </h1>
		<br>
		
		<h2>
		<% 
		boolean feedback = (boolean) request.getAttribute("feedback");
		String msg = null;
		
		Usuario usuario = (Usuario) request.getAttribute("usuario");
		session.setAttribute("usuario", usuario);
		
		if (feedback)
			msg = "Parabéns!! Você acertou :)";
		else
			msg = "Ouch! Infelizmente não foi dessa vez :(";
		
		out.print(msg);
		
		%>
		
		</h2>
		<a href="aprenda.jsp"> voltar </a>
	</body>
</html>