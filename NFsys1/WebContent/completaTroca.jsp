<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String nserie = (String) session.getAttribute("nSerie");
		String codprod = (String) session.getAttribute("codigoProd");
		String nf = (String) session.getAttribute("nf");
	
	%>
	
	<form method="post" action="insereTroca">
	<label>Codigo do Produto Devolvido a Unidade</label>
	<input type="text" id="devolvido" name="devolvido" value=<%=codprod%> readonly>
	<label>N�mero de S�rie do Produto Devolvido a Unidade</label>
	<input type="text" id="devolvido" name="devolvido" value=<%=nserie%> readonly>
	
	<label>Motivo</label>
	<input type="text" id="dTroca" name="dTroca" required>
	<label>N�mero de S�rio do Novo Produto</label>
	<input type="text" id="dTroca" name="dTroca" required>
	
	<input type="submit" id="enviar" name="enviar" value="Enviar">
	
	
	</form>

</body>
</html>