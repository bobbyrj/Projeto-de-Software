<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Upload</h2>

	<form method="post" action="uploadArq" enctype="multipart/form-data">
		<fieldset>
			<legend>Carregue o XML</legend>
			<fieldset class="campo">
				<label for="arquivo">Arquivo:</label> <input name="arquivo"
					id="arquivo" type="file" />
			</fieldset>
			<fieldset class="campo">
				<input type="submit" id="carrega" title="enviar" class="carrega"
					name="carrega" value="carregar" />
			</fieldset>
		</fieldset>
	</form>
	
	<br><br>

	<%
		//Retorna a Pagina Inicial
	%>

	<form method="post" action="inicialJsp" enctype="multipart/form-data">
		<input type="submit" id="carrega" title="enviar" class="carrega"
			name="carrega" value="Pagina Inicial" />
	</form>
</body>
</html>