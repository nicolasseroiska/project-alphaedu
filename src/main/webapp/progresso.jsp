<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Usuario"%>
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
    <link rel="stylesheet" href="css/menu.css" />

    <!-- Itens progresso CSS -->
    <link rel="stylesheet" href="css/progresso_itens.css" />

    <!-- Font Awesome Icones -->
    <link rel="stylesheet" href="css/all.min.css" />
  </head>

  <body>
  <% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
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
            <!-- Informações de pontos do Usuário -->

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
                <a href="aprenda.jsp" class="nav-link text-uppercase active text-black-50">
                  <img
                    class="mx-auto mb-1"
                    width="65px"
                    height="65px"
                    src="images/imagens_nav/aprenda_circulos_f.png"
                    alt="Opção Para página de Aprenda"
                  />
                  Aprenda
                </a>
              </li>
              <li class="nav-item">
                <a
                  href="progresso.jsp"
                  class="nav-link tamanho-fonte-nav text-uppercase active"
                  id="progresso"
                >
                  <img
                    class="bi mx-auto mb-1"
                    width="65"
                    height="65"
                    src="images/imagens_nav/progresso_barra.png"
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
	
    <div class="container-fluid px-lg-4 px-xl-5 pt-5">
      <div class="mb-4 mb-lg-5">
        <div class="row">
          <div class="col-xl-8 col-md-10 mb-4">
            <div class="card-widget-kid bg-blue h-100">
              <div class="card-widget-body text-white">
                <div class="text p-5">
                  <h3 class="mb-5">Ola, <% out.print(usuario.getNome() + " " + usuario.getSobrenome()); %>.</h3>
                  <h4 class="mb-0 text-white-50">Jogue suas fases</h4>
                </div>
              </div>
              <div class="w-25">
                <img
                  src="images/iconMilk.png"
                  class="img-perfil"
                  alt="icone de perfil"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mb-4 mb-lg-5">
        <div class="col-xl-12 col-md-10 mb-4">
          <div class="row justify-content-center">
            <div class="row justify-content-center">
              <div class="text"><h6>Sua ofensiva:</h6></div>
            </div>
            <div class="row justify-content-center">
              <div class="col-xl-10 col-md-12 mb-4">
                <div class="card-widget-week h-100">
                  <div class="card-widget-body justify-content-between">
                    <div class="col-auto">SEG.</div>
                    <div class="col-auto">TER.</div>
                    <div class="col-auto">QUA.</div>
                    <div class="col-auto">QUI.</div>
                    <div class="col-auto">SEX.</div>
                    <div class="col-auto">SÁB.</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="mb-3 mb-lg-5">
        <div class="row justify-content-center">
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card-widget h-100">
              <div class="card-widget-body">
                <div class="dot me-3 bg-yellow"></div>
                <div class="text">
                  <h6 class="mb-0">Ofensiva</h6>
                  <span class="text-black-50"> <% out.print(usuario.getPontos_fire()); %> </span>
                </div>
              </div>
              <div class="icon text-white bg-yellow">
                <i class="fas fa-fire"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card-widget h-100">
              <div class="card-widget-body">
                <div class="dot me-3 bg-orange"></div>
                <div class="text">
                  <h6 class="mb-0">Coroas</h6>
                  <span class="text-black-50"><% out.print(usuario.getPontos_coroa()); %></span>
                </div>
              </div>
              <div class="icon text-white bg-orange">
                <i class="fas fa-crown"></i>
              </div>
            </div>
          </div>
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card-widget h-100">
              <div class="card-widget-body">
                <div class="dot me-3 bg-red"></div>
                <div class="text">
                  <h6 class="mb-0">Vidas</h6>
                  <span class="text-black-50"><% out.print(usuario.getPontos_vida()); %></span>
                </div>
              </div>
              <div class="icon text-white bg-red">
                <i class="fas fa-heart"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mb-3 mb-lg-5">
        <h2 class="section-heading section-heading-ms mb-4 mb-lg-5">
          Estatísticas 💰
          <!-- https://tobiasahlin.com/blog/introduction-to-chartjs/ -->
        </h2>
        <div class="row">
          <div class="col-lg-7 mb-4 mb-lg-0">
            <div class="card h-100">
              <div class="card-header">
                <h4 class="card-heading">Your Account Balance</h4>
              </div>
              <div class="card-body">
                <div class="chart-holder w-100">
                  <div class="chartjs-size-monitor">
                    <div class="chartjs-size-monitor-expand">
                      <div class=""></div>
                    </div>
                    <div class="chartjs-size-monitor-shrink">
                      <div class=""></div>
                    </div>
                  </div>
                  <canvas
                    id="lineChart1"
                    height="254"
                    class="chartjs-render-monitor"
                    style="display: block; width: 509px; height: 254px"
                    width="509"
                  ></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 mb-4 mb-lg-0">
            <div class="h-50 pb-4 pb-lg-2">
              <div class="card h-100">
                <div class="card-body d-flex">
                  <div class="row w-100 align-items-center">
                    <div class="col-sm-5 mb-4 mb-sm-0">
                      <h2 class="mb-0 d-flex align-items-center">
                        <span>86.4</span
                        ><span class="dot bg-green d-inline-block ms-3"></span>
                      </h2>
                      <span class="text-muted text-uppercase small"
                        >Work hours</span
                      >
                      <hr />
                      <small class="text-muted">Hours worked this month</small>
                    </div>
                    <div class="col-sm-7">
                      <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                          <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                          <div class=""></div>
                        </div>
                      </div>
                      <canvas
                        id="pieChartHome1"
                        height="92"
                        class="chartjs-render-monitor"
                        style="display: block; width: 184px; height: 92px"
                        width="184"
                      ></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="h-50 pt-lg-2">
              <div class="card h-100">
                <div class="card-body d-flex">
                  <div class="row w-100 align-items-center">
                    <div class="col-sm-5 mb-4 mb-sm-0">
                      <h2 class="mb-0 d-flex align-items-center">
                        <span>325</span
                        ><span class="dot bg-indigo d-inline-block ms-3"></span>
                      </h2>
                      <span class="text-muted text-uppercase small"
                        >Tasks Completed</span
                      >
                      <hr />
                      <small class="text-muted"
                        >Tasks Completed this months</small
                      >
                    </div>
                    <div class="col-sm-7">
                      <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                          <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                          <div class=""></div>
                        </div>
                      </div>
                      <canvas
                        id="pieChartHome2"
                        height="92"
                        class="chartjs-render-monitor"
                        style="display: block; width: 184px; height: 92px"
                        width="184"
                      ></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootsrap javascript -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
      crossorigin="anonymous"
    ></script>
    <!-- <script src="scriptMenu.js"></script>
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
