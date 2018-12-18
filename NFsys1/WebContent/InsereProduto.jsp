<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="Object.Produto"%>
    <%@ page import="Object.NotaFiscal"%>
    <%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserção de Produto</title>
</head>
<body>

	<%
		List<Produto> produto = (List<Produto>) session.getAttribute("prod");
		NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
	%>
	
	<br>
	<br>
	<br> Modelo da Nota Fiscal: 	<%=nf.getModelo()%>
	<br> Serie da Nota Fiscal: 	<%=nf.getSerie()%>
	<br> Número da Nota Fiscal: 	<%=nf.getNumero()%>
	<br>
	<br>
	<br>

	<form method="post" action="insereBD" >
		<fieldset>
			<legend>Inserção de Número de Série de Produto</legend>
			<table>
				<tr>
					<td>Código</td>
					<td align='center'>Descrição</td>
					<td>Número de Série</td>
				</tr>
								

				<%
					for (int i = 0; i < produto.size(); i++) {
				%>
				
				<%
					for (int z = 0; z < produto.get(i).getQtd(); z++) {
				%>
				<tr>
					<td><%=produto.get(i).getCodigoProduto()%></td>
					<td><%=produto.get(i).getDescricao()%></td>
					<td><input type="text" id="nSerie" name="nSerie" /></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</table>
			<input type="submit" id="carrega" title="enviar" class="carrega"
				name="carrega" value="Validar"/>
		</fieldset>
	</form>


</body>
</html>