<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sobre o Programa</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
</head>
<style>
    .is-red{
        background-color: #87090D;        
    }
    .is-silver{
        background-color: silver;
        color: black;
        border:darkgrey solid;
    }
    .texto{
    	color: white;
    	font-weight:bold;  
        font-size:125%;	 
    }
    .titulo{
    	color: white;
    	font-weight:bold;
    	font-size:200%;    	 
    }
</style>
<body>
    

    <section class="hero is-medium">
        <div class="hero-body is-fullwidth is-fullheight is-red">
            <div class="container has-text-centered">
                <div class="columns">
                    <div class="column is-half is-offset-one-quarter">
						<h1 class="titulo">Informações para Logar</h1><br>
                        <article class="tile is-child notification">

                            <div class="has-text-weight-bold notification is-red texto">
                                Este programa foi criado por alunos da FAETERJ durante as f�rias causando muito sofrimento.<br>
                                Abaixo seguem informações para teste do programa.
                            </div>
                            <div class="has-text-weight-bold notification is-silver" style="color:white;">
						        Administrador: Login: admin - Senha: 12345 <br>
                                Usuario: Login: carequinha - Senha: 54321
                            </div>

                            <form method="post" action="login.jsp" enctype="multipart/form-data">
                                <div class="control">
                                    <button class="button is-outlined is-fullwidth" type="submit" id="carrega" title="enviar" class="carrega"
                                    name="carrega" value="Pagina Inicial">
                                    Voltar para a Pagina Inicial
                                    </button>
                                </div>
                            </form>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>             
</body>
</html>