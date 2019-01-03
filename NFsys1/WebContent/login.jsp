<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entre com suas informações de Login</title>
</head>
<body>

	<%
			String login = (String) session.getAttribute("login");
			if (login != null) {
				response.sendRedirect("index.jsp");
			} 
	%>
	<form action="login" method="post">
		<fieldset>
			<legend>Insira seus dados</legend>

			<input type="text" id="login" name="login" placeholder="usuario">
			<input type="password" id="senha" name="senha" placeholder="senha">
			<input type="reset" id="reset" name="reset" value="Apagar Formulario">
			<input type="submit" id="valida" name="valida" value="Entrar">
			
		</fieldset>
	</form>

</body>
</html>