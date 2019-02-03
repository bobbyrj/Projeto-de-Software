<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Relatorio de Troca</title>
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
				response.sendRedirect("../../login.jsp");
			} else if (!login.equals("admin")){
				session.setAttribute("erroPermissao", "Usu�rios n�o tem Permiss�o para acessar este item.");
				response.sendRedirect("../../login.jsp");
			}
	%>

	<section class="hero is-red is-fullwidth is-fullheight">
		<div class="hero-body">
			<div class="container has-text-centered">
				<div class="columns">
					<div class="column is-half is-offset-one-quarter">
						<article class="tile is-child notification">

							<div class="has-text-weight-bold notification is-red"
								style="color: white;">Gerar Relatório de Troca</div>

							<form method="post" action="geraRelatorio">

								<div class="field">
									<div class="control">
										<label><b>Motivo</b></label> <input class="input"
											list="motivos" id="relatorio" name="relatorio" required>
										<datalist id="motivos">
											<option value="Troca por defeito">
										</datalist>
									</div>
								</div>

								<div class="field">
									<div class="control">
										<label><b>Data Inicial</b></label> <input class="input"
											type="date" id="relatorio" name="relatorio">
									</div>
								</div>

								<div class="field">
									<div class="control">
										<label><b>Data Final</b></label> <input class="input"
											type="date" id="relatorio" name="relatorio">
									</div>
								</div>
								<br>
								<form method="post" action="resultadoRelatorio.jsp"
									enctype="multipart/form-data"></form>
								<div class="field">
									<div class="control">
										<button
											class="button is-inverted is-outlined is-fullwidth is-silver"
											type="submit" title="Gerar Relatório">Gerar
											Relatório</button>
									</div>
								</div>
							</form>
							</form>

						</article>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form method="post" action="../../index.jsp"
		enctype="multipart/form-data">
		<div class="control">
			<button class="button is-inverted is-outlined is-fullwidth carrega"
				type="submit" id="carrega" title="enviar" name="carrega"
				value="Pagina Inicial">Pagina Inicial</button>
		</div>
	</form>
</body>
</html>