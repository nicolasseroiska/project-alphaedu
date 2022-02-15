<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="model.Jogo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Jogos</title>
<link href="estilo.css" rel="stylesheet">
</head>
<body>

<h1> Jogos Cadastrados:</h1>

<%
	List<Jogo> listaJogos = new ArrayList<>();
	listaJogos = (ArrayList) request.getAttribute ("lista_jogos");
%>

<table id="customers">
	
	<tr>
	    <th>Palavra Correta</th>
    	<th>Palavra Falsa (1)</th>
    	<th>Palavra Falsa (2)</th>
    	<th>Palavra Falsa (3)</th>
  	</tr>
	<% for(Jogo jogo : listaJogos){
		out.print("<tr>");
		out.println("<td>" + jogo.getPalavrac() + "</td>");
		out.print("<td>" + jogo.getFalsa1() +"  </td>");
		out.print("<td>" + jogo.getFalsa2() +"  </td>");
		out.print("<td>" + jogo.getFalsa3() +"  </td>");
		out.print("</tr>");
		}
	%>

</table>

</body>
</html>