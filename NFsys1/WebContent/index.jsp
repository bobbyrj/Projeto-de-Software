<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sistema Nota Fiscal</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>
	<main>
		<section class="hero is-primary is-medium">
			<div class="hero-body">
				<div class="container has-text-centered">
					<div class="columns">
						<div class="column is-half is-offset-one-quarter">
						
											
							<!--Link Upload-->
							<div class="field">
								<form method="post" action="insereJsp" enctype="multipart/form-data">
									<button class="button is-primary is-inverted is-outlined is-fullwidth" type="submit" id="carrega" title="enviar" class="carrega"
									name="carrega" value="Cadastrar Produto">
									Cadastrar Produto
									</button>
								</form>
							</div>
							

							<!--Link Troca-->
							<div class="field">
								<form method="post" action="trocaJsp" enctype="multipart/form-data">
									<button class="button is-primary is-inverted is-outlined is-fullwidth" type="submit" id="carrega" title="enviar" class="carrega"
									name="carrega" value="Trocar Produto">
									Trocar Produto
									</button>
								</form>
							</div>

							<!--Gerar relatorio-->
							<div class="field">
								<form method="post" action="relatorioJsp" enctype="multipart/form-data">
									<button class="button is-primary is-inverted is-outlined is-fullwidth" type="submit" id="carrega" title="enviar" class="carrega"
									name="carrega" value="Gerar Relatorio">
									Gerar Relatorio 
									</button>
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>				  		
	</main>
</body>
</html>
