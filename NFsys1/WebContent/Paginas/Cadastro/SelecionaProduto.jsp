<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="Object.Produto"%>
<%@ page import="Object.Item"%>
<%@ page import="Object.NotaFiscal"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html"charset="ISO-8859-1">
	<title>Seleção de Produto</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
    <style>
        .is-red{
            background-color: #87090D;       
        }
        .is-silver{
            background-color: silver;
            color: black;
            border:darkgrey solid;
        }
        .is-white{
            color: white;
        }
    </style>
</head>
<body>

	<%
	String login = (String) session.getAttribute("login");
	if (login == null) {
	response.sendRedirect("login.jsp");
	} 
	%>

    <section class="hero is-red is-fullwidth is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
				<%
				List<Produto> produto = (List<Produto>) session.getAttribute("prod");
				NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
				List<Item> itensNF = (List<Item>) session.getAttribute("itens");
				Set<Integer> posicao = (Set<Integer>) session.getAttribute("posicao");
				String alterado = (String) session.getAttribute("itemAlterado");
				Item novo = (Item) session.getAttribute("itemNovo");
				
				/*int pos = 0;
				int posmax = 0;
				if (posicao != null) {
					posmax = posicao.size();
				}*/					
				
				%>

				<% if (alterado != null && novo != null) {%>
					<h2> O produto <%=novo.getDescricao()%> teve seu nï¿½mero
					de sï¿½rie alterado de <%=alterado%> para
					<%=novo.getNumeroDeSerie()%> </h2>
				<%} %>
				
                <article class="tile is-child notification">
                    <div class="has-text-weight-bold  notification is-red" style="color:white;">
                        Modelo da Nota Fiscal: 	<%=nf.getModelo()%><br>
                        Serie da Nota Fiscal: 	<%=nf.getSerie()%><br>
                        Numero da Nota Fiscal: 	<%=nf.getNumero()%>
                    </div>

                    <div class="has-text-weight-bold  notification is-silver">
                        Selecione um produto para inserir o nÃºmero de sÃ©rie
                    </div>
                    <hr>
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
                                <% if (posicao != null && posicao.contains(i)) {%>
                                <td><input type="radio" name="produto" id="produto" value="<%=i%>" disabled></td>
                                    
                                <%} else {%>
                                <td><input type="radio" name="produto" id="produto" value="<%=i%>" required></td>
                                <%}%>
                                                                
                                <td><%=produto.get(i).getCodigoProduto()%></td>
                                <td><%=produto.get(i).getDescricao()%></td>
                                <td><%=produto.get(i).getQtd()%></td>
                            </tr>

                            <%}%>

                        </table>

                        <div class="buttons is-right">
                            <input class="button is-inverted is-outlined" type="submit" value="Inserir NÃºmero de SÃ©rie do Produto Selecionado">
                        </div>
                    </form>
				
				<% if (itensNF != null) { %>	
					<form method="post" action="AlteraProduto.jsp">
						<h1>Produtos já Inseridos!</h1><br>
						<div class="has-text-weight-bold  notification is-silver">
                            Selecione um Produto para Alteração Caso seja Necessario
                        </div>
						<table class="table is-fullwidth">
								<thead>
									<tr>
										<th></th>
										<th>Codigo</th>
										<th>Descricao</th>
										<th>Número de Série</th>
									</tr>
								</thead>                
								<%
								
								
								
								for (int i = 0; i < itensNF.size(); i++) {
								%>
								<tr>
									
									<td><input type="radio" name="produto" id="produto" value="<%=i%>" required></td>
									<td><%=itensNF.get(i).getCodigoProduto()%></td>
									<td><%=itensNF.get(i).getDescricao()%></td>									
									<td><%=itensNF.get(i).getNumeroDeSerie()%></td>
								</tr>
								<%} %>
						</table>
						<div class="buttons is-right">
                            <input class="button is-inverted is-outlined" type="submit" value="Alterar Produto Selecionado">
                        </div>
					</form>
                <%} %>
				<form method="post" action="insereBD">            
					<div class="buttons is-right">
						<button class="button is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
						name="carrega" value="Validar">
						Finalizar Cadastro de Produto
					</button>
				</div>
			    </form>
            </article>
        </div>
    </div>
</section>		
</body>
</html>