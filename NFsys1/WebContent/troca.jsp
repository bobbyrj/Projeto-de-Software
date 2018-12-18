<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Troca de Produto</title>
</head>
<body>
	<form method="post" action="trocaItem" >
		<fieldset>
			<legend>Insira o Número de Série do Produto a ser Trocado</legend>
			<input type="text" id="nSerie" name="nSerie" />
			<input type="submit" id="carrega" title="enviar" class="carrega"
				name="carrega" value="Validar"/>
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