<!-- Nicolas Seroiska - ht1910213 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Status</title>
	</head>
	
	<body>
		
		<h1> Status</h1>
		<br>
		
		<h2>
		<% 
		boolean status = (boolean) request.getAttribute("status"); 
		String operacao = (String) request.getAttribute("operacao");
		String msg = null;
		
		if (status)
			msg = "O conjunto foi " + operacao + " com sucesso :)";
		else
			msg = "Erro! O conjunto não pôde ser " + operacao +  " :(";
		
		out.print(msg);
			
		%>
		
		</h2>
	
	</body>
</html>