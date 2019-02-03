<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entre com suas informações de Login</title>
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

	<main>
	<section class="hero is-red is-fullwidth is-fullheight">
		<div class="hero-body">
			<div class="container has-text-centered">
				<div class="columns">
					<div class="column is-half is-offset-one-quarter">
						<article class="tile is-child notification">

							<%
                                String login = (String) session.getAttribute("login");
                                
                                if (login != null) {
                                    response.sendRedirect("index.jsp");
                                } 
                            %>

							<%
                                String erro = (String) session.getAttribute("erro");
                                String msgErro = "Login ou Senha incorretos";
                            %>

							<form action="login" method="post">
								<div class="has-text-weight-bold notification is-silver">
									Insira seus dados</div>
								<%
                                    if (erro != null) {
                                        if (erro.equals("1")) { %>
								<%=msgErro%>
								<br>
								<%erro = null;%>
								<%}%>
								<%} 
                                %>

								<div class="field">
									<div class="control">
										<input class="input" type="text" id="login" name="login"
											placeholder="usuario" value="admin" required>
									</div>
								</div>

								<div class="field">
									<div class="control">
										<input class="input" type="password" id="senha" name="senha"
											placeholder="senha" value="12345" required>
									</div>
								</div>

								<div class="field is-grouped">
									<div class="control">
										<input class="button input" type="submit" id="valida"
											name="valida" value="Entrar">
									</div>

									<div class="control">
										<input class="button input" type="reset" id="reset"
											name="reset" value="Apagar Formulario">
									</div>
							</form>
							<!--Sobre o Programa-->
							<div class="control">
								<form method="post" action="about.jsp"
									enctype="multipart/form-data">
									<button
										class="button is-inverted is-outlined is-fullwidth carrega"
										type="submit" id="carrega" title="enviar" name="carrega"
										value="Sobre o Programa">Sobre o Programa</button>
								</form>
							</div>
					</div>



					</article>
				</div>
			</div>
		</div>
		</div>
	</section>
	</main>
</body>
</html>