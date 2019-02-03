<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Troca de Produto</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
<style>
.is-red {
	background-color: #87090D;
}

.is-silver {
	background-color: silver;
	color: black;
	border: darkgrey solid;
}

.is-white {
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
				<div class="columns">
					<div class="column is-half is-offset-one-quarter">
						<article class="tile is-child notification">
							<div class="has-text-weight-bold  notification is-silver">
								Insira o Numero de Serie do Produto a ser Trocado</div>
							<form method="post" action="trocaItem">
								<div class="field">
									<div class="control">
										<input class="input" type="text" id="nSerie" name="nSerie"
											required>
									</div>
								</div>
								</td>
								<td>
									<div class="buttons is-centered">
										<button class="button is-inverted is-outlined carrega"
											type="submit" id="carrega" title="enviar" name="carrega"
											value="Validar">Validar</button>
									</div>
							</form>


						</article>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Retorna a Pagina Inicial-->
	<form method="post" action="../../index.jsp"
		enctype="multipart/form-data">
		<div class="buttons is-centered">
			<button class="button is-inverted is-outlined" type="submit"
				id="carrega" title="enviar" class="carrega" name="carrega"
				value="Pagina Inicial">Pagina Inicial</button>
		</div>
	</form>
</body>
</html>