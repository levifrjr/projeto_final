<%@page import="modelo.dominio.Disciplina"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONFIRMAÇÃO DO CADASTRO</title>

<style type="text/css">
.tituloCampo {
	text-align: right;
	color: blue;
}
</style>

</head>
<body>
	<a href="exibirDisciplina">LISTAR DISCIPLINAS CADASTRADAS</a>
	<jsp:useBean id="disciplina" class="modelo.dominio.Disciplina"
		scope="request"></jsp:useBean>
	<table>
		<tr>
			<td class="tituloCampo">Nome:</td>
			<td><%=disciplina.getNome() %></td>
		</tr>
		<tr>
			<td class="tituloCampo">Cod:</td>
			<td><%=disciplina.getCod() %></td>
		</tr>
	</table>
</body>
</html>