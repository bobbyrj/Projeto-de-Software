<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%@ page import="Object.Produto"%>
    <%@ page import="Object.Item"%>
    <%@ page import="Object.NotaFiscal"%>
    <%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Número de Série de Produto Inserido</title>
</head>
<body>
	<%
		String login = (String) session.getAttribute("login");
		if (login == null) {
			response.sendRedirect("login.jsp");
		}

		List<Produto> produto = (List<Produto>) session.getAttribute("prod");
		NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
	
		int i = Integer.parseInt(request.getParameter("produto"));
	%>

	

	<br>
	<br>
	Modelo da Nota Fiscal:<%=nf.getModelo()%><br>
	Série da Nota Fiscal: <%=nf.getSerie()%><br>
	Numero da Nota Fiscal: <%=nf.getNumero()%><br>
	Produto selecionado: <%=nf.getItems().get(i).getDescricao()%><br>
	Código do Produto selecionado: <%=nf.getItems().get(i).getCodigoProduto()%><br>
	Número de Série do Produto selecionado: <%=nf.getItems().get(i).getNumeroDeSerie()%><br>
	<br>
	<br>
	<form method="post" action="controleCadastro"> 
		<fieldset>
			<legend> Insira o novo Numero de Série do Produto </legend>
			<input type="hidden" id="seqProduto" name="seqProduto" value="<%=i%>">
			<input type="text" id="nSerie" name="nSerie" required>
		</fieldset>
		<input type="hidden" id="alterarproduto" name="alterarproduto" value="alterar">
		<input type="submit" id="envia" name="envia">
	</form>
</body>
</html>