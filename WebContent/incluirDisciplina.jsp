<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CADASTRO</title>

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
	else if (f.id.value == '')
	{
		alert('Precisa preencher o campo COD.');
		f.matricula.focus();
		return false;
	}
	return true;
}
</script>
<jsp:useBean id="disciplina" class="modelo.dominio.Disciplina"
	scope="request"></jsp:useBean>
</head>
<%
	String mensagem = (String) request.getAttribute("mensagem");
	if (mensagem != null)
		out.println("<h3>" + mensagem + "</h3>");
%>
<body>
	<form action="salvarDisciplina" method="post"
		onsubmit="return validar()">
		<table>
			<tr>
				<td class="tituloCampo">Nome:</td>
				<td><input type="text" name="nome"
					value="<%=disciplina.getNome() %>" size="14" maxlength="20"></td>
			</tr>
			<tr>
				<td class="tituloCampo">Cod:</td>
				<td><input type="text" name="cod"
					value='<jsp:getProperty property="cod" name="disciplina"/>' size="5"
					maxlength="5"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Enviar"> <input
					type="reset" value="Limpar"> <input type="button"
					value="Cancelar" onClick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
</body>
</html>