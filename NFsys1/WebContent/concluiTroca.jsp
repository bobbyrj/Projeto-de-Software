<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Troca de Produto</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>
	<%
		String nserie = (String) session.getAttribute("nSerie");
		String codprod = (String) session.getAttribute("codigoProd");
		String nf = (String) session.getAttribute("nf");
	
	%>
	
    <section class="hero is-primary is-medium">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="columns">
                    <div class="column is-half is-offset-one-quarter">
                        <b>O Produto foi Encontrado: Digite as Informacoes Abaixo</b>
                        <br><hr>
                        <form method="post" action="insereTroca">

                            <div class="field">
                                <label>Produto Encontrado:</label>
                                <div class="control">
                                    <input class="input" type="text" id="devolvido" name="devolvido" value=<%=nserie%> readonly>
                                </div>
                            </div>
                            
                            <div class="field">
                                <label>Motivo:</label>
                                <div class="control">
                                    <input class="input" type="text" id="motivo" name="motivo" required>
                                </div>
                            </div>

                            <div class="field">
                                <label>Numero de Serie do Novo Produto:</label>
                                <div class="control">
                                    <input class="input" type="text" id="nSerieTroca" name="nSerieTroca" required>
                                </div>
                            </div>                                   
                            
                            <div class="control">
                                <button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega"
                                title="enviar" name="carrega" value="Validar">
                                Validar
                                </button>
                            </div>

                        </form>	
                        
                         <!--Retorna a Pagina Inicial-->
                        <hr>
                        <form method="post" action="inicialJsp" enctype="multipart/form-data">
                            <div class="control">
                                <button class="button is-primary is-inverted is-outlined is-fullwidth" type="submit" id="carrega" title="enviar" class="carrega"
                                name="carrega" value="Pagina Inicial">
                                Pagina Inicial
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