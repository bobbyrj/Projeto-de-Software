<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="Object.Produto"%>
    <%@ page import="Object.NotaFiscal"%>
    <%@ page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insercao de Produto</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>

    <section class="hero is-primary is-medium">
            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="columns">
                        <div class="column is-three-fifths
                        is-offset-one-fifth">
                            <%
                                List<Produto> produto = (List<Produto>) session.getAttribute("prod");
                                NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
                            %>
                        
                        <br>
                        <br>
                        Modelo da Nota Fiscal: 	<%=nf.getModelo()%><br>
                        Serie da Nota Fiscal: 	<%=nf.getSerie()%><br>
                        Numero da Nota Fiscal: 	<%=nf.getNumero()%><br>
                        <br>
                        <br>

                        <b>Insercao de Numero de Serie de Produto</b><hr>
                        <form method="post" action="insereBD">                                                        
                            <table class="table is-fullwidth">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Descricao</th>
                                        <th>Numero de Serie</th>
                                    </tr>
                                </thead>                
                
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
                            <div class="control">
                                <button class="button is-primary is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
                                name="carrega" value="Validar">
                                Validar
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