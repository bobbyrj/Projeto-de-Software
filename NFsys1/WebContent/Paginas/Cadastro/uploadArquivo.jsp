<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carregar Arquivo XML</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
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
		
    <section class="hero is-red is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">                
                <div class="columns">
                    <div class="column is-half is-offset-one-quarter">
                        <article class="tile is-child notification">
                            <div class="box">
                                <form method="post" action="uploadArq" enctype="multipart/form-data">   
                                    <b>Carregue o XML</b><br><br>
                                    <label for="arquivo">Arquivo:</label> 
                                    <input name="arquivo" id="arquivo" type="file" required/>

                                    <button class="button is-small is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
                                    name="carrega" value="carregar">Enviar</button>
                                </form>
                            
                                <!--Retorna a Pagina Inicial-->
                                <hr>
                                <form method="post" action="../../index.jsp" enctype="multipart/form-data">
                                    <div class="buttons is-centered">
                                        <button class="button is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
                                        name="carrega" value="Pagina Inicial">
                                        Pagina Inicial
                                        </button>
                                    </div>
                                </form>  
                            </div> 
                        </article> 
                    </div>
                </div> 
            </div>
        </div>
	</section>	
</body>
</html>