<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
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
						<div class="column is-half is-offset-one-quarter">

							<form method="post" action="uploadArq" enctype="multipart/form-data">   
                                <b>Carregue o XML</b><br><br>
                                <label for="arquivo">Arquivo:</label> 
                                <input name="arquivo" id="arquivo" type="file" required/>

                                <button class="button is-small is-primary is-inverted is-outlined" type="submit" id="carrega" title="enviar" class="carrega"
                                name="carrega" value="carregar">Carregar</button>
							</form>
						
							<!--Retorna a Pagina Inicial-->
                            <hr>
                            <form method="post" action="index.jsp" enctype="multipart/form-data">
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