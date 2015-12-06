<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="modelo.dominio.Professor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CADASTRAR PROFESSOR</title>
</head>
<body>
	<h2>PreON</h2>
	<h3>CADASTRAR PROFESSOR</h3>

	<%
	List<Professor> listaP = (List<Professor>) request.getAttribute("listaP");

	if (listaP.isEmpty())
	{
%>
	Você ainda não cadastrou nenhum professor, deseja começar?
	<a href="incluirProfessor">INCLUIR</a>
	<br>
	<%	
	}
	else
	{
%>

	Opções:
	<a href="incluirProfessor">INCLUIR</a>
	<br>
	<br> Lista dos Professor:
	<table cellpadding="5" cellspacing="0" border="1">
		<tr>
			<td>OPÇÕES</td>
			<td>NOME</td>
			<td>MATICULA</td>
			<td>E-MAIL</td>
			<td>ESPECIALIDADE</td>
		</tr>
		<%		
		for (Professor professor: listaP)
		{
%>

		<tr>
			<td><a href="alterarProfessor?matricula=<%=professor.getMatricula()%>">Alterar</a><br>
				<a href="excluirProfessor?matricula=<%=professor.getMatricula()%>">Excluir</a></td>
			<td><%=professor.getNome()%></td>
			<td><%=professor.getMatricula()%></td>
			<td><%=professor.getEmail()%></td>
			<td><%=professor.getEspecialidade()%></td>
		</tr>
		<%
		}
	}
%>
	</table>
	<br>
	<br>
	<a href="index.jsp">Voltar ao Menu Principal</a>
</body>
</html>