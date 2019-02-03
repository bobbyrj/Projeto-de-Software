<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

	<%
		String nserie = (String) session.getAttribute("nSerie");
		String codprod = (String) session.getAttribute("codigoProd");
		String nf = (String) session.getAttribute("nf");
	
	%>

	<section class="hero is-red is-fullwidth is-fullheight">
	<div class="hero-body">
		<div class="container has-text-centered">
			<div class="columns">
				<div class="column is-half is-offset-one-quarter">
					<article class="tile is-child notification">
					<form method="post" action="insereTroca">

						<div class="field">
							<div class="control">
								<label><b>Codigo do Produto Devolvido a Unidade</b></label> <input
									class="input" type="text" id="devolvido" name="devolvido"
									value=<%=codprod%> readonly>
							</div>
						</div>
						<div class="field">
							<div class="control">
								<label><b>Numero de Serie do Produto Devolvido a
										Unidade</b></label> <input class="input" type="text" id="devolvido"
									name="devolvido" value=<%=nserie%> readonly>
							</div>
						</div>
						<div class="field">
							<div class="control">
								<label><b>Motivo</b></label> <input class="input" type="text"
									id="dTroca" name="dTroca" required>
							</div>
						</div>
						<div class="field">
							<div class="control">
								<label><b>Numero de Serie do Novo Produto</b></label> <input
									class="input" type="text" id="dTroca" name="dTroca" required>
							</div>
						</div>
						<div class="field">
							<div class="buttons is-right">
								<input class="button is-inverted is-outlined" type="submit"
									id="enviar" name="enviar" value="Enviar">
							</div>
						</div>
					</form>
					<!--Retorna a Pagina Inicial--> </article>
				</div>
			</div>
		</div>
	</div>
	</section>
	<form method="post" action="troca.jsp" enctype="multipart/form-data">
		<div class="buttons is-centered">
			<button class="button is-inverted is-outlined" type="submit"
				id="carrega" title="enviar" class="carrega" name="carrega"
				value="Voltar">Voltar para Página de Troca</button>
		</div>
	</form>
</body>
</html>