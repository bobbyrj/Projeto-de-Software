<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="Object.Produto"%>
    <%@ page import="Object.Item"%>
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
                        Série da Nota Fiscal: 	<%=nf.getSerie()%><br>
                        Numero da Nota Fiscal: 	<%=nf.getNumero()%><br>
                        <br>
                        <br>

                        <b>Inserção de Número de Série de Produto</b><hr>
                        <form method="post" action="controleCadastro">                                                        
                            <table class="table is-fullwidth">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Descrição</th>
                                        <th>Número de Série</th>
                                    </tr>
                                </thead>                
                
                                <%
                                    int i = Integer.parseInt(request.getParameter("produto"));                                	
                                %>
                                
                                <input type="hidden" id="seqProduto" name="seqProduto" value="<%=i%>">
                                <%
                                    for (int z = 0; z < produto.get(i).getQtd(); z++) {
                                %>
                                <tr>
                                    <td><%=produto.get(i).getCodigoProduto()%></td>
                                    <td><%=produto.get(i).getDescricao()%></td>
                                    <td><input type="text" id="nSerie" name="nSerie" required></td>
                                </tr>
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