<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Troca</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>

	<%
			String login = (String) session.getAttribute("login");
			if (login == null) {
				response.sendRedirect("login.jsp");
			} 
	%>
		
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
						
					<form method="post" action="insereTroca">

                        <div class="field">
                                <label>Codigo do Produto Devolvido a Unidade:</label>
                                <div class="control">
                                    <input class="input" type="text" id="devolvido" name="devolvido" value=<%=codprod%> readonly>
                                </div>
                            </div>
                                
                        <div class="field">
                            <label>Numero de Serie do Produto Devolvido a Unidade:</label>
                            <div class="control">
                                <input class="input" type="text" id="devolvido" name="devolvido" value=<%=nserie%> readonly>
                            </div>
                        </div>

                        <div class="field">
                                <label>Motivo</label>
                                <div class="control">
                                    <input class="input" type="text" id="dTroca" name="dTroca" required>
                                </div>
                            </div>   

                        <div class="field">
                            <label>Numero de Serie do Novo Produto:</label>
                            <div class="control">
                                <input class="input" type="text" id="dTroca" name="dTroca" required>
                            </div>
                        </div>    
                                                
                        <div class="control">
                            <button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="enviar" name="enviar" value="Enviar">
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