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
<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
<title>Insercao de Produto</title>
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
    /*var count = 0;

    for ( i=0; i < document.FormName.elements.length; i++ ) {

    if ( ~~ document.FormName.elements.value ) {

    count++;

    }

    }*/
    %>
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
                Set<String> itensInseridos = (Set<String>) session.getAttribute("itensInseridos");
                String posicao = (String) session.getAttribute("nProduto");
                String erro = (String) session.getAttribute("erro");
                int i;
            %>
            
            <%
                if (posicao == null) {
                	i = Integer.parseInt(request.getParameter("produto"));                                	
                } else {
                	i = Integer.parseInt(posicao);
                }
 			%>  
                    
                <article class="tile is-child notification">
                    <div class="has-text-weight-bold  notification is-silver">
                        Modelo da Nota Fiscal: 	<%=nf.getModelo()%><br>
                        Série da Nota Fiscal: 	<%=nf.getSerie()%><br>
                        Número da Nota Fiscal: 	<%=nf.getNumero()%><br>
                    </div>
                    <br>
                    <br>
                        
                    <div class="has-text-weight-bold notification is-silver">
                        Inserção de Número de Série de Produto
                    </div>
                    <hr>
                    <form method="post" action="controleCadastro">                                                        
                        <table class="table is-fullwidth">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descrição</th>
                                    <th>Número de Série</th>
                                </tr>
                            </thead>  
                            <tbody>            
                                                          
                                <input type="hidden" id="seqProduto" name="seqProduto" value="<%=i%>">
                                
                                <tr>
                                    <td><%=produto.get(i).getCodigoProduto()%></td>
                                    <td><%=produto.get(i).getDescricao()%></td>
                                    <td><input type="text" id="nSerie" name="nSerie" required></td>
                                </tr>
                                
                            </tbody> 
                        </table>
                        <%
							if (itensInseridos != null) {%>
								<%=itensInseridos.size()%>/<%=produto.get(i).getQtd()%>
							<%} else { %>
								0/<%=produto.get(i).getQtd()%>
                    <%}%>
						
						<%
							if (erro != null) { %>
								<%=erro %> 
							<%}%>
                                            
                        <tfoot>
                            <div class="buttons is-right">
                                <button class="button is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega" name="carrega" value="Validar">
                                    Validar
                                </button>
                            </div>
                        </tfoot>
                        
                        <% if (itensInseridos != null) { %>	
					
						<h1>Produtos J� Inseridos</h1><br><br>
						
						<table class="table is-fullwidth">
								<thead>
									<tr>									
										<th>N�mero de S�rie</th>
									</tr>
								</thead>                
								<%														
									for (String st: itensInseridos) {
								%>
								<tr>									
									<td><%=st%></td>
								</tr>
								<%} %>
						</table>						
				
				<%} %>                        
                    </form>
                </article>       
            </div>
        </div>
    </section>		
</body>
</html>