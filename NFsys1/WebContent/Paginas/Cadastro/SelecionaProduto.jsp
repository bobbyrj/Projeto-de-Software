<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="Object.Produto"%>
    <%@ page import="Object.NotaFiscal"%>
    <%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seleção de Produto</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>

		<%
			String login = (String) session.getAttribute("login");
			if (login == null) {
				response.sendRedirect("login.jsp");
			} 
		%>

    <section class="hero is-primary is-medium">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="columns">
                        <div class="column is-three-fifths
                        is-offset-one-fifth">
                            <%
                                List<Produto> produto = (List<Produto>) session.getAttribute("prod");
                                NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
                                List<Item> itensNF = (List<Item>) session.getAttribute("itens");
                            %>
                        
                        <br>
                        <br>
                        Modelo da Nota Fiscal: 	<%=nf.getModelo()%><br>
                        Serie da Nota Fiscal: 	<%=nf.getSerie()%><br>
                        Numero da Nota Fiscal: 	<%=nf.getNumero()%><br>
                        <br>
                        <br>

                        <b>Selecione um produto para inserir o número de série</b><hr>
                        <form method="post" action="InsereProduto.jsp">                                                        
                            <table class="table is-fullwidth">
                                <thead>
                                    <tr>
                                    	<th></th>
                                        <th>Codigo</th>
                                        <th>Descricao</th>
                                        <th>Quantidade</th>
                                    </tr>
                                </thead>                
                                         
                                <%
                                    for (int i = 0; i < produto.size(); i++) {
                                %>
                                   
                                <tr>
                                	<% if (itensNF == null) { %>
                                    	<td><input type="radio" name="produto" id="produto" value="<%=i%>" required></td>
                                    <%} else if (itensNF.get(i)) %>
                                    
                                    <td><%=produto.get(i).getCodigoProduto()%></td>
                                    <td><%=produto.get(i).getDescricao()%></td>
                                    <td><%=produto.get(i).getQtd()%></td>
                                </tr>
                                
                                <%}%>
                                
                            </table>
                            
                            <form method="post" action="InsereProduto">
                            <input type="submit" value="Inserir Número de Série do Produto Selecionado">
                            
                            </form>
                                                        
                            <div class="control">
                                <button class="button is-primary is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
                                name="carrega" value="Validar">
                                Finalizar Cadastro de Produto
                                </button>
                            </div>
                        </form>
                                                        
                    </div>
                </div>
            </div>
        </div>
    </section>		
</body>
</html>