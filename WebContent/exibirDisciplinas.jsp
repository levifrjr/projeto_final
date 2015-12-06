<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="modelo.dominio.Disciplina"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CADASTRAR DISCIPLINAS</title>
</head>
<body>
	<h2>PreON</h2>
	<h3>CADASTRAR DISCIPLINAS</h3>

	<%
	List<Disciplina> lista = (List<Disciplina>) request.getAttribute("lista");

	if (lista.isEmpty())
	{
%>
	Você ainda não cadastrou nenhuma disciplina, deseja começar?
	<a href="incluirDisciplina">INCLUIR</a>
	<br>
	<%	
	}
	else
	{
%>

	Opções:
	<a href="incluirDisciplina">INCLUIR</a>
	<br>
	<br> Lista das Disciplinas:
	<table cellpadding="5" cellspacing="0" border="1">
		<tr>
			<td>OPÇÕES</td>
			<td>NOME</td>
			<td>COD</td>
		</tr>
<%		
		for (Disciplina disciplina: lista)
		{
%>

		<tr>
			<td><a href="alterarDisciplina?cod=<%=disciplina.getCod()%>">Alterar</a><br>
				<a href="excluirDisciplina?cod=<%=disciplina.getCod()%>">Excluir</a>
			</td>
			<td><%=disciplina.getNome()%></td>
			<td><%=disciplina.getCod()%></td>
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