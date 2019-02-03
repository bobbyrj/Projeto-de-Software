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
<title>Alterar N�mero de S�rie de Produto Inserido</title>
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

		List<Produto> produto = (List<Produto>) session.getAttribute("prod");
		NotaFiscal nf = (NotaFiscal) session.getAttribute("nf");
	
		int i = Integer.parseInt(request.getParameter("produto"));
	%>

    <section class="hero is-medium">
        <div class="hero-body is-fullwidth is-fullheight is-red">
            <div class="container has-text-centered">
                <div class="columns">
                    <div class="column is-half is-offset-one-quarter">
                        <article class="tile is-child notification">
                            <div class="has-text-weight-bold notification" style="color:#87090D; border:darkgrey solid;">
                                Modelo da Nota Fiscal: <%=nf.getModelo()%><br>
                                Série da Nota Fiscal: <%=nf.getSerie()%><br>
                                Numero da Nota Fiscal: <%=nf.getNumero()%><br>
                                Produto selecionado: <%=nf.getItems().get(i).getDescricao()%><br>
                                Código do Produto selecionado: <%=nf.getItems().get(i).getCodigoProduto()%><br>
                                Número de Série do Produto selecionado: <%=nf.getItems().get(i).getNumeroDeSerie()%><br>
                            </div>
                        
                        <br>
                            <form method="post" action="controleCadastro"> 
                                <div class="container is-fluid">
                                    <div class="has-text-weight-bold">
                                        Insira o novo Número de Série do Produto 
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="control">
                                        <input class="input" type="hidden" id="seqProduto" name="seqProduto" value="<%=i%>">
                                    </div>
                                </div>

                                <div class="field">
                                    <div class="control">
                                        <input class="input" type="text" id="nSerie" name="nSerie" required>
                                    </div>
                                </div>

                                <div class="control">
                                    <input class="button is-silver input" type="hidden" id="alterarproduto" name="alterarproduto" value="alterar">
                                    <input class="button is-silver input" type="submit" id="envia" name="envia">
                                </div>
                            </form>
                        
                        </article>
                    </div>
                </div>
            </div>
        </div>                        
    </section>
</body>
</html>