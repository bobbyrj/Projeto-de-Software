<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Troca de Produto</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<body>
		<section class="hero is-primary is-medium">
				<div class="hero-body">
					<div class="container has-text-centered">
						<div class="columns">
							<div class="column is-half is-offset-one-quarter">
							
								<form method="post" action="insereTroca">
                                    <legend>Numero do Produto Encontrado: Digite as Informacoes
                                        Abaixo</legend>

                                    <div class="field">
                                        <label class="label">Motivo:</label>
                                        <div class="control">
                                            <input class="input" type="text" id="motivo" name="motivo">
                                        </div>
                                    </div>

                                    <div class="field">
                                        <label class="label">Numero de Serie do Novo Produto:</label>
                                        <div class="control">
                                            <input class="input" type="text" id="nSerieNovo" name="nSerieNovo">
                                        </div>
                                    </div>                                   
                                    
                                    <div class="control">
                                        <button class="button is-primary is-inverted is-outlined is-fullwidth" type="submit" id="carrega"
                                        title="enviar" class="carrega" name="carrega" value="Validar">
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
