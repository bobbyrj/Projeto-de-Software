<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Relatorio</title>
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
                    
                %>
                        
                    <article class="tile is-child notification">
                        
                        <div class="has-text-weight-bold notification is-silver"">
                            Relatório de Troca
                        </div>
                        <hr>                                                     
                            <table class="table is-fullwidth">
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Descrição</th>
                                        <th>Número de Série</th>
                                        <th>Data da troca</th>
                                        <th>Motivo</th>
                                    </tr>
                                </thead>  
                                <tbody>                                            
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody> 
                            </table>                    
                            <tfoot>
                                <form method="post" action="index.jsp" enctype="multipart/form-data">
                                    <div class="buttons is-centered">
                                        <button class="button is-inverted is-outlined carrega" type="submit" id="carrega" title="enviar"
                                        name="carrega" value="Pagina Inicial">
                                        Pagina Inicial
                                        </button>
                                    </div>
                                </form>
                            </tfoot>     
                    </article>       
                </div>
            </div>
        </section>

</body>
</html>