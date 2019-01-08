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
	
		<%
			String login = (String) session.getAttribute("login");
		
			if (login == null) {
				response.sendRedirect("login.jsp");
			} 
		%>
		
		
		
		<main>
			<section class="hero is-primary is-medium">
				<div class="hero-body">
					<div class="container has-text-centered">
						<div class="columns">
							<div class="column is-half is-offset-one-quarter">
							
							<% if (login != null) { %>
									Logado como <%=login.toUpperCase() %>
									<br>
							<%}	%>							
							
												
								<!--Link Upload-->
								<div class="field">
									<form method="post" action="Paginas/Cadastro/uploadArquivo.jsp" enctype="multipart/form-data">
										<button class="button is-primary is-inverted is-outlined is-fullwidth carrega" 
										name="carrega" type="submit" id="carrega" title="enviar" value="Cadastrar Produto">
										Cadastrar Produto
										</button>
									</form>
								</div>
								
	
								<!--Link Troca-->
								<div class="field">
									<form method="post" action="Paginas/Troca/troca.jsp" enctype="multipart/form-data">
										<button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega" title="enviar"
										name="carrega" value="Trocar Produto">
										Trocar Produto
										</button>
									</form>
								</div>
	
								<!--Gerar relatorio-->
								<div class="field">
									<form method="post" action="Paginas/Relatorio/relatorio.jsp" enctype="multipart/form-data">
										<button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega" title="enviar" 
										name="carrega" value="Gerar Relatorio">
										Gerar Relatório 
										</button>
									</form>
								</div>
								
								<% 
									String erro = (String) session.getAttribute("erroPermissao");	
									if (erro != null) { %>
										Erro: <%=erro%>
									<%} %>
								
								
								<!--Logout-->
								
								<div class="field">
									<form method="post" action="deslogar" enctype="multipart/form-data">
										<button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega" title="enviar" 
										name="carrega" value="deslogar">
										Sair da Sessão 
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