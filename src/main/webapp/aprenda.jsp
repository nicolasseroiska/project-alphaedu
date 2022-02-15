<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="model.Usuario"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="images/typers.png" />
    <title>DislexiaAlphaEdu - Aprenda</title>
    <!-- Fonte ROBOTO GoogleFonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
      rel="stylesheet"
    />

    <!-- Bootsrap CSS-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous"
    />

    <!-- Menu CSS -->
    <link rel="stylesheet" href="menu.css" />
  </head>
  <body>
  
  <% Usuario usuario = (Usuario) request.getAttribute("usuario");
  	 if(usuario == null){
  	 	usuario = (Usuario) session.getAttribute("usuario");
  	 }
  	 else{
  		session.setAttribute("usuario", usuario);
  	 }
  	 int qtd_fases = usuario.getPontos_coroa() / 5;
  	 Random rand = new Random();%>
  
    <header>
      <div class="px-3 py-2 bg-white text-black">
        <div class="container">
          <div
            class="
              d-flex
              flex-wrap
              align-items-center
              justify-content-center justify-content-lg-start
            "
          >
            <!-- InformaÃ§Ãµes de pontos do UsuÃ¡rio -->

            <a
              href="#"
              class="
                d-flex
                align-items-center
                my-2 my-lg-0
                me-lg-auto
                text-black text-decoration-none
                m-3
              "
            >
              <img
                src="images/iconMilk.png"
                width="68px"
                height="68px"
                alt="icone"
                aria-expanded="false"
                id="fotoPerfil"
                class="rounded-circle nav-item"
              />
              <% out.print(" " + usuario.getNome() + " " + usuario.getSobrenome()); %>
            </a>
            <div class="d-block me-lg-auto">
              <img
                src="images/imagens_nav/fire.png"
                width="47px"
                height="47px"
                alt="icone"
                aria-expanded="false"
                class="nav-item m-3"
              />
              <i id="ofensiva" class="nav-item"><% out.print(usuario.getPontos_fire()); %></i>
              <img
                src="images/imagens_nav/crown.png"
                width="57px"
                height="55px"
                alt="icone"
                aria-expanded="false"
                class="nav-item m-3"
              />
              <i id="coroas" class=""><% out.print(usuario.getPontos_coroa()); %></i>
              <img
                src="images/imagens_nav/heart.png"
                width="43px"
                height="43px"
                alt="icone"
                aria-expanded="false"
                class="nav-item m-3"
              />
              <i id="vidas" class=""><% out.print(usuario.getPontos_vida()); %></i>
            </div>
            <ul
              class="
                nav
                col-12 col-lg-auto
                my-2
                justify-content-center
                my-md-0
                text-small
              "
            >
              <!-- Menu de navegaÃ§Ã£o -->

              <li class="nav-item">
                <a href="#" class="nav-link text-uppercase tamanho-fonte-nav">
                  <img
                    class="mx-auto mb-1"
                    width="65px"
                    height="65px"
                    src="images/imagens_nav/aprenda_circulos.png"
                    alt="Opção Para página de Aprenda"
                  />
                  Aprenda
                </a>
              </li>
              <li class="nav-item">
                <a
                  href="progresso.jsp"
                  class="
                    nav-link
                    text-uppercase text-black-50
                    tamanho-fonte-nav
                    active
                  "
                  id="progresso"
                >
                  <img
                    class="bi mx-auto mb-1"
                    width="65px"
                    height="65px"
                    src="images/imagens_nav/progresso_barra_f.png"
                    alt="Opção Para página de Progresso"
                    id="progressoImg"
                  />
                  Progresso
                </a>
              </li>
              <li class="nav-item dropdown">
                <a
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                  class="
                    nav-link
                    dropdown-toggle
                    text-uppercase text-black-50
                    active
                  "
                >
                  <img
                    class="mx-auto mb-1"
                    width="65px"
                    height="65px"
                    src="images/imagens_nav/mais_icone_f.png"
                    alt="Opção Para O Menu Mais Opções"
                    id="maisImg"
                  />
                  Mais
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Perfil</a></li>
                  <li><a class="dropdown-item" href="#">Configurações</a></li>
                  <li><hr class="dropdown-divider" /></li>
                  <li>
                    <a class="dropdown-item text-black-50" href="#">Ajuda</a>
                  <a class="dropdown-item text-black-50" href="#">Sobre Nós</a>
                    <a class="dropdown-item text-black-50" href="index.html">Logoff</a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <div class="d-block divisor-nav"></div>
    <div class="img-fluid m-auto d-none"><img src="images/Banner3.png" alt="banner TypersTeam" width="100%"></div>
    <!-- Body main -->
    <main class="container-fluid row justify-content-between m-0">

      <!-- Liga e outros -->
      <div class="col-lg-3 justify-content-lg-evenly row fundo-liga p-5 ">
        <div class="display-6 text-center"><p>LIGA</p></div>
        <div class="col-auto"><img src="images/league.png" height="140" width="140" alt="liga1"></div>
        <div class="col-auto"><img src="images/league.png" height="140" width="140" alt="liga1"></div>
        <div class="col-auto"><img src="images/league.png" height="140" width="140" alt="liga1"></div>
        <div class="col-auto"><img src="images/league.png" height="140" width="140" alt="liga1"></div>
        <div class="col-auto"><img src="images/league.png" height="140" width="140" alt="liga1"></div>

        <div class="row"><div class="col-auto m-auto">><img src="images/Typers252.png" height="252" width="252" alt="logo typers"></div></div>
      </div>
      <!-- Fases -->
      <div class="fundo-main justify-content-lg-center col-lg-9 p-5">
      
      <% 
      	int n = 1;
      	int contagem = 0;
      	if(usuario.getPontos_coroa() > 0){
      		for(int i = 1; i <= qtd_fases; i++){
          		contagem++;
          		  
          	  	System.out.println("Entrou - 1 for ");
          	 	out.print("<div class='row w-100 justify-content-center m-auto'>");
          	  	out.print("<div class='col-auto m-auto'>");
          	 	out.print("<a href='JogoController?acao=jogar' class='text-black text-decoration-none'>");
                 
          	 	out.print("<img class='bd-placeholder-img img-fluid' role='img' aria-label='Placeholder: 140x140' focusable='false'" + "src='images/icones_fases/" + (int)Math.floor(Math.random()*(9-1+1)+1) + ".png'></img>");
          	  
                out.print("<p class='m-auto texto-bold text-center'>Introdução</p>");
                out.print("</a>");
                out.print("</div>");
                out.print("</div>");
                
                if(contagem == 2){
                  System.out.println("Entrou IF");
                  contagem = 0;
                  System.out.println("VALOR DENTRO DE I: " + i);

                  	  for(int j = 1; j <= qtd_fases - i && j <=5; j++){
                  	  	System.out.println("ENTROU FOR - JJJJJJJJJ");/////
                  	  	if(j == 1){
                  	  		n = 1;
                  	  	}
                  	  	if(j == n)
                  	  		out.print("<div class='row w-100  m-auto'>");
                  	  	
                  	  	out.print("<div class='col-auto m-auto'>");
                  	  	out.print("<a href='JogoController?acao=jogar' class='text-black text-decoration-none'>");
                  	  	out.print("<img class='bd-placeholder-img img-fluid m-3' width='120' height='120' role='img' aria-label='Placeholder: 140x140' focusable='false' src='images/icones_fases/" + (int)Math.floor(Math.random()*(9-1+1)+1) + ".png'></img>");
                  	  	out.print("<p class='m-auto texto-bold text-center'>Introdução</p>");
                  	  	out.print("</a>");
                  	  	out.print("</div>");
                  	    
                  	  	System.out.println("Valor de n: " + n);
                  	 	System.out.println("Valor de j: " + j);
                  	 	
                  	 	if(j == qtd_fases - i){
        					out.print("</div>");
                    		i = i + j;
                    		System.out.println("Valor de i: " + i);
                    	}
                  	 	else if(j == 2){
                  	  		out.print("</div>");
                  	 	}
                  	 	else if(j == 5){
                  	  		out.print("</div>");
                  	  		i = i + j;
                  	  		System.out.println("Valor de i: " + i);
                  	 	}
                  	 	
                  	 	
        				if(j - n == n)
        					n = n + 2;
        				else if(j - n == 2)
        					n = 1;
                      } 
                   }   
          	  }
      	}
      	 
      %>

		

      </div>
      <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

      <div class="container-fluid">
          <div class="row">.col-lg</div>

      </div>

    </main>

    <!-- Bootsrap javascript -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
      crossorigin="anonymous"
    ></script>
    <script src="scriptMenu.js"></script>
    <!-- Jquerry -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
      $("#navbarDropdown").on({
        click: function () {
          var src =
            $("#maisImg").attr("src") === "images/imagens_nav/mais_icone.png"
              ? "images/imagens_nav/mais_icone_f.png"
              : "images/imagens_nav/mais_icone.png";
          $("#maisImg").attr("src", src);
        },
      });
    </script>
  </body>
</html>
