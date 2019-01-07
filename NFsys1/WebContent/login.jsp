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
	
	<%
		String erro = (String) session.getAttribute("erro");
		String msgErro = "Login ou Senha incorretos";
		
		if (erro != null) {
			if (erro.equals("1")) { %>
				<%=msgErro%>
			<%}%>
		<%} 
	%>
	<form action="login" method="post">
		<fieldset>
			<legend>Insira seus dados</legend>

			<input type="text" id="login" name="login" placeholder="usuario" required>
			<input type="password" id="senha" name="senha" placeholder="senha" required>
			<input type="reset" id="reset" name="reset" value="Apagar Formulario">
			<input type="submit" id="valida" name="valida" value="Entrar">
			
		</fieldset>
	</form>

<!--Sobre o Programa-->
								<div class="field">
									<form method="post" action="about.jsp" enctype="multipart/form-data">
										<button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega" title="enviar" 
										name="carrega" value="Sobre o Programa">
										Sobre o Programa
										</button>
									</form>
								</div>

</body>
</html>