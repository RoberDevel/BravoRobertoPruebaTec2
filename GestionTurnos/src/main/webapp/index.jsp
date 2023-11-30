
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="css/bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

        </style>
    </head>
    <body>
        <div class="row" style="height: 100%;">

            <div class="col-4 p-3 text-white bg-dark" style="width: 325px">
                <h3>Turnero</h3>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link active  text-white" aria-current="page"><i class="bi bi-house"></i>
                            Inicio
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoConCodigo.jsp" class="nav-link text-white" onmouseover="mostrarMensaje(this)" onmouseout="ocultarMensaje(this)" > <i class="bi bi-plus-circle"></i>

                            Pedir turno con código de usuario
                        </a>
                        <div id="miMensaje" style="display: none; position: absolute; background-color: #86b7fe; padding: 10px; border: 1px solid #d4d4d4; border-radius: 5px; z-index: 1;">
                            Necesitas crear un turno sin código de usuario primero
                        </div>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoSinCodigo.jsp" class="nav-link text-white" ">
                            <i class="bi bi-plus-square"></i>

                            Pedir turno sin código de usuario
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="listarTurnosPorFecha.jsp" class="nav-link text-white"><i class="bi bi-file-medical"></i>
                            Listar turnos por Fecha
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="listarTurnosPorAtendidos.jsp" class="nav-link text-white"><i class="bi bi-filter-circle"></i>
                            Filtrado de turnos
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="modificacionAtendido.jsp" class="nav-link text-white"><i class="bi bi-arrow-repeat"></i>
                            Modificar estado del turno
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-8" >
                <div class="container" style="height: 100%; padding: 60px">

                    <div class="row" >

                        <div class="col-6">
                            <div class="card-container ">
                                <a href="pedirTurnoConCodigo.jsp" class="card text-white bg-primary">
                                    <div class="card custom-card">
                                        <h5 class="card-header">Pedir turno con código de usuario</h5>
                                        <div class="card-body">
                                            <p class="card-text">Púlsame si quieres pedir turno si ya tienes tu código de usuario</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>


                        <div class="col-6">
                            <div class="card-container" >
                                <a href="pedirTurnoSinCodigo.jsp" class="card text-white bg-primary">
                                    <div class="card custom-card">
                                        <h5 class="card-header" >Pedir turno sin código de usuario</h5>
                                        <div class="card-body">
                                            <p class="card-text">Púlsame si quieres pedir turno si no tienes tu código de usuario</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px" >

                        <div class="col-6" >
                            <div class="card-container">
                                <a href="listarTurnosPorFecha.jsp" class="card text-white bg-primary">
                                    <div class="card custom-card">
                                        <h5 class="card-header"> Listar turnos por Fecha</h5>
                                        <div class="card-body">
                                            <p class="card-text">Púlsame si quieres pedir turno si ya tienes tu código de usuario</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>


                        <div class="col-6" >
                            <div class="card-container" >
                                <a href="listarTurnosPorAtendidos.jsp" class="card text-white bg-primary">
                                    <div class="card custom-card" >
                                        <h5 class="card-header">Listar turnos por estado</h5>
                                        <div class="card-body">
                                            <p class="card-text">Púlsame si quieres listar los turnos por "en espera" o "atendidos"</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div class="row" style="margin-top: 30px" >

                        <div class="col-6" >
                            <div class="card-container">
                                <a href="modificacionAtendido.jsp" class="card text-white bg-primary">
                                    <div class="card custom-card">
                                        <h5 class="card-header"> Modificar estado del turno</h5>
                                        <div class="card-body">
                                            <p class="card-text">Púlsame si quieres cambiar el estado del turno</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>




                    </div>
                    <!-- Botón que te muestra la pagina de resultado sin necesidad de introducir turno -->
                    <!-- <a href="Resultado.jsp">
                        <button type="button" style="margin-top: 20px">Ir a Resultado</button>
                    </a> -->
                    <!-- Botón que te muestra la pagina de resultado2 sin necesidad de introducir turno -->
                    <a href="Resultado2.jsp">
                        <button type="button" style="margin-top: 20px">Ir a Resultado</button>
                    </a>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script>
                            function mostrarMensaje(enlace) {
                                var rect = enlace.getBoundingClientRect();
                                document.getElementById("miMensaje").style.display = "block";
                                document.getElementById("miMensaje").style.left = rect.left + "px";
                                document.getElementById("miMensaje").style.top = rect.bottom + "px";
                            }


                            function ocultarMensaje() {
                                document.getElementById("miMensaje").style.display = "none";
                            }

        </script>

    </body>
</html>
