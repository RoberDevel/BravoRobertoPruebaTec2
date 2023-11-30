<%@page import="com.trabajos.gestionturnos.logic.Turno"%>

<%@page import="java.util.List"%>
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

        </style>
    </head>
    <body>
        <div class="row" style="height: 100%;">
            <div class="col-4 p-3 text-white bg-dark" style="width: 325px">
                <h3>Turnero</h3>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link   text-white" aria-current="page"><i class="bi bi-house"></i>
                            Inicio
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoConCodigo.jsp" class="nav-link text-white" onmouseover="mostrarMensaje(this)" onmouseout="ocultarMensaje(this)" > <i class="bi bi-plus-circle"></i>

                            Pedir turno con código de usuario
                        </a>

                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoSinCodigo.jsp" class="nav-link text-white ">
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
                        <a href="listarTurnosPorAtendidos.jsp" class="nav-link text-white "><i class="bi bi-filter-circle"></i>
                            Filtrado de turnos
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="modificacionAtendido.jsp" class="nav-link text-white active"><i class="bi bi-arrow-repeat"></i>
                            Modificar estado del turno
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-8" >
                <div class="container">

                    <div class="row justify-content-center align-items-center"><h1 class="text-center" style="margin-top: 30px">Modifica el estado del turno</h1></div>

                    <form action="ModificacionAtendidoSv" method="get" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="consultaTurno">Código del turno</label>
                            <input type="text" class="form-control"  name="idC" required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Buscar</button>
                    </form>
                    <% if (request.getAttribute("turno") != null) {%>
                    <div class="row" >

                        <div class="col-12" style="margin-top: 30px">

                            <% Turno turno = (Turno) request.getAttribute("turno");%>
                            <form id="form1" action="ModificacionAtendidoSv" method="post" accept-charset="UTF-8">
                                <table class="table">

                                    <thead class="table-dark">
                                        <tr>
                                            <th class="text-center">Nombre</th>
                                            <th class="text-center">Trámite</th>
                                            <th class="text-center">Atendido</th>
                                        </tr>
                                    </thead>
                                    <tr>


                                        <td class="text-center"><%= turno.getUnCiudadano().getNombre()%>&nbsp;&nbsp;<%= turno.getUnCiudadano().getApellido()%></td>
                                        <td class="text-center"><%= turno.getUnTramite().getDescripcion()%></td>
                                        <td class="text-center"><%= turno.isAtendido() ? "Si" : "No"%></td>
                                    <input type="hidden" name="atendido" value="<%= turno.isAtendido()%>">
                                    <input type="hidden" name="turnoId" value="<%= turno.getId()%>">
                                    </tr>

                                </table>
                            </form>
                        </div>
                        <div>
                            <button class="btn btn-primary" type="submit" form="form1" >Modificar</button>
                        </div>
                    </div>
                    <% }%>

                </div>
            </div>
        </div>


    </body>
</html>
