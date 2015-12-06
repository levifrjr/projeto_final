<%@page import="modelo.dominio.Professor"%>
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
	<a href="exibirProfessor">LISTAR PROFESSORES CADASTRADOS</a>
	<jsp:useBean id="professor" class="modelo.dominio.Professor" scope="request"></jsp:useBean>
	<table>
		<tr>
			<td class="tituloCampo">Nome:</td>
			<td><%=professor.getNome() %></td>
		</tr>
				<tr>
			<td class="tituloCampo">MATICULA:</td>
			<td><%=professor.getMatricula()%></td>
		</tr>
		<tr>
			<td class="tituloCampo">E-mail:</td>
			<td><%=professor.getEmail()%></td>
		</tr>
		<tr>
			<td class="tituloCampo">Especialidade:</td>
			<td><%=professor.getEspecialidade()%></td>
		</tr>
	</table>
</body>
</html>