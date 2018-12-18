<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema Nota Fiscal</title>

<style type="text/css">
	body {
		background: #7B68EE;
		font-size: 80%;
		padding: 20px;
	}
	
	main {
	  background: white;
	  margin: 0 auto;
	  padding: 10px;
	  max-height: 200px;
	  max-width: 200px;
	}

	main div {
	  background: black;
	  margin: 0 auto;
	  color: white;
	  padding: 15px;
	  margin: 5px auto;
	  text-align: center;
	}

</style>

</head>
<body>
		<main>
			<div>
				<%
					//Link Upload
				%>

				<form method="post" action="insereJsp" enctype="multipart/form-data">
					<input type="submit" id="carrega" title="enviar" class="carrega"
						name="carrega" value="Cadastrar Produto" />
				</form>
			</div>
			

			<div>
				<%
					//Link Troca
				%>

				<form method="post" action="trocaJsp" enctype="multipart/form-data">
					<input type="submit" id="carrega" title="enviar" class="carrega"
						name="carrega" value="Trocar Produto" />
				</form>
			</div>

			<div>
				<%
					//Link Relatorio
				%>

				<form method="post" action="relatorioJsp"
					enctype="multipart/form-data">
					<input type="submit" id="carrega" title="enviar" class="carrega"
						name="carrega" value="Gerar Relatorio" />
				</form>
		
			</div>
		</main>
</body>
</html>