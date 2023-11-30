
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            p {
                font-size: 28px;

            }
            .fechTurn{
                font-size: 20px;
            }
            .fechTurnRes{
                font-size: 26px;
                font-weight: bold;
            }
            .resaltado {
                font-weight: bold;
                font-size: 36px;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="row" style="height: 100%; background-color: lightblue">
            <div class="col-4 p-3 text-white bg-dark" style="width: 325px">
                <h3>Turnero</h3>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link text-white" aria-current="page"><i class="bi bi-house"></i>
                            Inicio
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoConCodigo.jsp" class="nav-link text-white" onmouseover="mostrarMensaje(this)" onmouseout="ocultarMensaje(this)" > <i class="bi bi-plus-circle"></i>

                            Pedir turno con código de usuario
                        </a>
                        <div id="miMensaje" style="display: none; position: absolute; background-color: #86b7fe; padding: 10px; border: 1px solid #d4d4d4; border-radius: 5px; z-index: 1;">
                            Para obtener el código necesitas pedir un turno sin código de usuario primero
                        </div>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoSinCodigo.jsp" class="nav-link text-white">
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
                <div class="container">


                    <h1 style="text-align: center; margin-top: 20px">Gracias <%= request.getAttribute("nombre")%> <%= request.getAttribute("apellido")%>! Su solicitud se ha completado correctamente!</h1>
                    <br>
                    <br>
                    <label class="fechTurn">Fecha de su cita: <span class="fechTurnRes"><%= request.getAttribute("fecha")%></span>  </label>
                    <hr>
                    <label class="fechTurn">Turno: <span class="fechTurnRes"><%= request.getAttribute("numero")%></span>  </label>
                    <br>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-12">
                            <p>Si desea cambiar el estado del turno el código es: <span class="resaltado"><%= request.getAttribute("id")%></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
