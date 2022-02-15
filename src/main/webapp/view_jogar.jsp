<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Usuario"%>
<%@page import="model.Jogo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Collections"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="images/typers.png" />
    <title>DislexiaAlphaEdu - Jogo 1</title>
    <!-- Fonte ROBOTO GoogleFonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" />
    <!-- Bootsrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

    <!-- Bootsrap CSS-->

    <style type="text/css">
        body {
            background-color: #eefffa;
            margin: 5%;
        }
        
        .container-fluid {
            width: 80%;
            font-family: "Segoe UI";
            font-size: 20px;
            box-sizing: border-box;
            border: 3px solid white;
            border-radius: 10px;
            margin: 0;
            position: absolute;
            top: 40%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%);
        }
        
        .progress-bar-success {
            background-color: #28bafd;
            border-radius: 5px;
        }
        
        .progress-bar {
            height: 25px;
            color: #fff;
            box-shadow: inset 0 -1px 0 rgb(0 0 0/ 15%);
        }
        
        .progress {
            float: right;
            height: 11%;
            width: 60%;
            margin: auto;
            box-shadow: inset 0 -1px 0 rgb(0 0 0/ 15%);
        }
        
        .prim {
            display: inline-flex;
            margin: 1%;
            width: 100%;
        }
        
        .sair {
            height: auto;
            width: 5%;
        }
        
        .prof {
            width: 300px;
        }
        
        .button {
            width: 40px;
            height: 40px;
            display: inline-flex;
            cursor: pointer;
            background-color: #1dadf0;
            border: none;
            border-radius: 13px;
            box-shadow: 0 9px #999;
        }
        
        .button_2 {
            width: 25%;
            height: 65px;
            display: block;
            cursor: pointer;
            background-color: #4caf50;
            border: none;
            border-radius: 35px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 9px #999;
        }
        
        .button_sair {
            width: 55px;
            height: 55px;
            display: block;
            cursor: pointer;
            background-color: #1dadf0;
            border: none;
            border-radius: 35px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 9px #999;
        }
        
        .professor {
            display: inline-flex;
            height: 300px;
            width: auto;
        }
        
        .button:active {
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        
        .button_2:active {
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        
        .button_sair:active {
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        
        .audio {
            width: 65%;
            height: 56%;
            margin: 8px 5px 2px auto;
        }
        
        .btn_p {
            display: inline-block;
            width: 100px;
            height: 60px;
            margin: 5px;
            margin-top: 15px;
            background-color: white;
            color: black;
            border: 2px solid #e7e7e7;
            border-radius: 10px;
            box-shadow: 0 9px #999;
            text-align: center;
        }
        
        .btn_p:hover {
            border: 2px solid #2ea7d4;
        }
        
        .btn_p:active {
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
        
        .divisor_topo {
            height: 2px;
            width: 75%;
            display: block;
            margin: 25px auto;
            border-radius: 5px;
        }
        
        .sair {
            height: auto;
            width: 10%;
        }
        
        @media ( max-width: 1100px) {
            .sair {
                height: auto;
                width: 11%;
            }
            .professor {
                width: 350px;
                height: auto;
            }
            .btn_p {
                width: 200px;
                justify-content: center;
                align-items: center;
            }
        }
        
        @media ( max-width: 850px) {
            .sair {
                height: auto;
                width: 15%;
            }
        }
        
        @media ( max-width: 625px) {
            .container-fluid {
                width: 100%;
                height: 100%;
                justify-content: center;
                margin: 45% auto;
                align-items: center;
            }
            .button_2 {
                width: 55%;
            }
        }
        
        input[type="radio"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        
        .boxed label {
            display: inline-block;
            width: 200px;
            padding: 10px;
            border: solid 2px #ccc;
            transition: all 0.3s;
        }
        
        .boxed input[type="radio"] {
            display: none;
        }
        
        .boxed input[type="radio"]:checked+label {
            border: solid 2px green;
        }
    </style>
</head>

<body>

    <%
	List<String> listaConjunto = new ArrayList<>();
	Jogo conjunto = (Jogo) request.getAttribute("conjunto_rng");

	listaConjunto.add(conjunto.getPalavrac());
	listaConjunto.add(conjunto.getFalsa1());
	listaConjunto.add(conjunto.getFalsa2());
	listaConjunto.add(conjunto.getFalsa3());

	Collections.shuffle(listaConjunto);
	System.out.println(listaConjunto);
	Usuario usuario = (Usuario) session.getAttribute("usuario");
	%>

    <div class="container-fluid">
        <div class="row d-inline-flex prim" height="15%">
        	<a href="aprenda.jsp">
        		<button class="button_sair" action="view_jogos.jsp">
              		<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="black" class="bi bi-x-circle" viewBox="0 0 16 16">
                		<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                		<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
              		</svg>
            	</button>
           	 	<div class="col-auto w-75 progress">
            		<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">40%</div>
            	</div>
        	</a> 
        </div>
        <form action="JogoController" class="boxed" method="get">

            <input type="text" style="display: none" name="palavrac" value="<%=conjunto.getPalavrac()%>">
             <input type="text" style="display: none" name="usuario_id" value="<%=usuario.getId()%>">

            <div class="row align-items-center m-0" height="70%">
                <!-- Coluna professor -->
                <div class="col-3">
                    <img class="img-fluid professor" src="images/professor.png" alt="professor" />
                    <!-- Imagem botao audio -->
                    <button type="button" class="button" onclick="playAudio('game_resources/<% out.print(conjunto.getId() + "/certo.mp3"); %>')">
						<img class="audio" src="images/audio.png" alt="audio" />
					</button>
                </div>

                <!-- Coluna palavras -->

                <div class="col-6 justify-content-center">

                    <div class="row justify-content-center">

                        <!-- Imagem relacionada -->
                        <img class="d-block m-0 p-0 h-50 w-50" src="game_resources/<% out.print(conjunto.getId() + "/image.png"); %>" alt="imagem_relacionada">
                        <div class="">


                            <!-- <input type="radio" name="palavrae" id="palavra3" value="<%=listaConjunto.get(2)%>" class=" btn_pd-inline-block -->
                            <!-- Radio Buttons -->
                            <input type="radio" name="palavrae" id="palavra1" value="<%=listaConjunto.get(0)%>" class="" 
                            onclick="playAudio('game_resources/<% 
						          		if(listaConjunto.get(0).equals(conjunto.getPalavrac())){
						          			out.print(conjunto.getId() + "/certo.mp3");
						          		}
						          		else if(listaConjunto.get(0).equals(conjunto.getFalsa1())){
						          			out.print(conjunto.getId() + "/falso1.mp3");
						          		}
						          		else if(listaConjunto.get(0).equals(conjunto.getFalsa2())){
						          			out.print(conjunto.getId() + "/falso2.mp3");
						          		}
						          		else if(listaConjunto.get(0).equals(conjunto.getFalsa3())){
						          			out.print(conjunto.getId() + "/falso3.mp3");
						          		}%>')">
                            <label for="palavra1" class="btn_p d-inline-block justify-content-center align-items-center"><%=listaConjunto.get(0)%></label>
                            
                            <input type="radio" name="palavrae" id="palavra2" value="<%=listaConjunto.get(1)%>" class="" onclick="playAudio('game_resources/<% 
						          		if(listaConjunto.get(1).equals(conjunto.getPalavrac())){
						          			out.print(conjunto.getId() + "/certo.mp3");
						          		}
						          		else if(listaConjunto.get(1).equals(conjunto.getFalsa1())){
						          			out.print(conjunto.getId() + "/falso1.mp3");
						          		}
						          		else if(listaConjunto.get(1).equals(conjunto.getFalsa2())){
						          			out.print(conjunto.getId() + "/falso2.mp3");
						          		}
						          		else if(listaConjunto.get(1).equals(conjunto.getFalsa3())){
						          			out.print(conjunto.getId() + "/falso3.mp3");
						          		}%>')">
                            <label for="palavra2" class="btn_p d-inline-block justify-content-center align-items-center"><%=listaConjunto.get(1)%></label>

                            <input type="radio" name="palavrae" id="palavra3" value="<%=listaConjunto.get(2)%>" class="" onclick="playAudio('game_resources/<% 
						          		if(listaConjunto.get(2).equals(conjunto.getPalavrac())){
						          			out.print(conjunto.getId() + "/certo.mp3");
						          		}
						          		else if(listaConjunto.get(2).equals(conjunto.getFalsa1())){
						          			out.print(conjunto.getId() + "/falso1.mp3");
						          		}
						          		else if(listaConjunto.get(2).equals(conjunto.getFalsa2())){
						          			out.print(conjunto.getId() + "/falso2.mp3");
						          		}
						          		else if(listaConjunto.get(2).equals(conjunto.getFalsa3())){
						          			out.print(conjunto.getId() + "/falso3.mp3");
						          		}%>')">
                            <label for="palavra3" class="btn_p d-inline-block justify-content-center align-items-center"><%=listaConjunto.get(2)%></label>

                            <input type="radio" name="palavrae" id="palavra4" value="<%=listaConjunto.get(3)%>" class="" onclick="playAudio('game_resources/<% 
						          		if(listaConjunto.get(3).equals(conjunto.getPalavrac())){
						          			out.print(conjunto.getId() + "/certo.mp3");
						          		}
						          		else if(listaConjunto.get(3).equals(conjunto.getFalsa1())){
						          			out.print(conjunto.getId() + "/falso1.mp3");
						          		}
						          		else if(listaConjunto.get(3).equals(conjunto.getFalsa2())){
						          			out.print(conjunto.getId() + "/falso2.mp3");
						          		}
						          		else if(listaConjunto.get(3).equals(conjunto.getFalsa3())){
						          			out.print(conjunto.getId() + "/falso3.mp3");
						          		}%>')">
                            <label for="palavra4" class="btn_p d-inline-block justify-content-center align-items-center"><%=listaConjunto.get(3)%></label>


                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-black bg-opacity-50 divisor_topo"></div>
            <div class="row justify-content-center">
                <button type="submit" name="acao" value="verificar" class="button_2 text-center">CHECAR</button>
            </div>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function playAudio(url) {
    	  new Audio(url).play();
    	}
    </script>
</body>

</html>