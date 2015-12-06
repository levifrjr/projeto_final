<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INCLUIR PROFESSOR</title>

<style type="text/css">
.tituloCampo {
	text-align: right;
	color: blue;
}
</style>

<script type="text/javascript">
function validar()
{
	var f = document.forms[0];
	if (f.nome.value == '')
	{
		alert('Precisa preencher o campo NOME.');
		f.nome.focus();
		return false;
	}
	else if (f.matricula.value == '')
	{
		alert('Precisa preencher o campo MATRICULA.');
		f.matricula.focus();
		return false;
	}
	return true;
}
</script>
<jsp:useBean id="professor" class="modelo.dominio.Professor" scope="request"></jsp:useBean>
</head>
<%
	String mensagem = (String) request.getAttribute("mensagem");
	if (mensagem != null)
		out.println("<h3>" + mensagem + "</h3>");
%>
<body>
	<form action="salvarProfessor" method="post" onsubmit="return validar()">
		<table>
			<tr>
				<td class="tituloCampo">Nome:</td>
				<td><input type="text" name="nome"
					value="<%=professor.getNome() %>" size="30" maxlength="80"></td>
			</tr>
			<tr>
				<td class="tituloCampo">Matricula:</td>
				<td><input type="text" name="matricula"
					value='<jsp:getProperty property="matricula" name="professor"/>' size="11"
					maxlength="11"></td>
			</tr>
			<tr>
				<td class="tituloCampo">E-mail:</td>
				<td><input type="text" name="email"
					value='<jsp:getProperty property="email" name="professor"/>' size="30"
					maxlength="80"></td>
			</tr>
			<tr>
				<td class="tituloCampo">Especialidade:</td>
				<td><input type="text" name="especialidade"
					value='<jsp:getProperty property="especialidade" name="professor"/>'
					size="20" maxlength="20"></td>
			</tr>
			<tr>
				<td></td>
					<td><input type="submit" value="Enviar"> 
					<input type="reset" value="Limpar">
					<input type="button" value="Cancelar" onClick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
</body>
</html>








