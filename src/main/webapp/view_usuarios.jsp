<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Usuarios</title>
<link href="estilo.css" rel="stylesheet">
</head>
<body>

<h1> Usuarios Cadastrados:</h1>

<%
	List<Usuario> listaUsuarios = new ArrayList<>();
	listaUsuarios = (ArrayList) request.getAttribute ("lista_usuarios");
%>

<table id="customers">
	
	<tr>
	    <th>Nome</th>
    	<th>Sobrenome</th>
    	<th>Data de Nascimento</th>
    	<th>Email</th>
    	<th>Senha</th>
  	</tr>
	<% for(Usuario usuario : listaUsuarios){
		out.print("<tr>");
		out.println("<td>" + usuario.getNome() + "</td>");
		out.print("<td>" + usuario.getSobrenome() +"  </td>");
		out.print("<td>" + usuario.getNasc() +"  </td>");
		out.print("<td>" + usuario.getEmail() +"  </td>");
		out.print("<td>" + usuario.getSenha() +"  </td>");
		out.print("</tr>");
		}
	%>

</table>

</body>
</html>