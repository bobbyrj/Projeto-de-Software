<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Troca de Produto</title>
</head>
<body>
	<form method="post" action="insereTroca">
		<fieldset>
			<legend>Número do Produto Encontrado: Digite as Informações
				Abaixo</legend>
			Motivo:<br> <input type="text" id="troca" name="troca" />
			Número de Série do Novo Produto:<br> <input type="text"
				id="troca" name="troca" />
				
				<input type="submit" id="carrega"
				title="enviar" class="carrega" name="carrega" value="Validar" />
		</fieldset>
	</form>
</body>
</html>