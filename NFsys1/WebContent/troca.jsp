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
                        
                        <b>Insira o Numero de Serie do Produto a ser Trocado</b><br>
                        <form method="post" action="trocaItem">                                
                            <div class="field">                               
                                <div class="control">
                                    <input class="input" type="text" id="nSerie" name="nSerie">
                                </div>
                            </div>                                   
                            
                            <div class="control">
                                <button class="button is-primary is-inverted is-outlined is-fullwidth carrega" type="submit" id="carrega" title="enviar"
                                name="carrega" value="Validar">
                                Validar
                                </button>
                            </div>    
                        </form>	

                        <!--Retorna a Pagina Inicial-->
                        <hr>
                        <form method="post" action="inicialJsp" enctype="multipart/form-data">
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