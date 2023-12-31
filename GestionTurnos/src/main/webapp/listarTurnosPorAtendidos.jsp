<%@page import="com.trabajos.gestionturnos.logic.Turno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtrado de turnos</title>
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
        <div class="row" style="height: 100%; background-color: lightblue">
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
                        <a href="listarTurnosPorAtendidos.jsp" class="nav-link text-white active"><i class="bi bi-filter-circle"></i>
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
                    <div class="row justify-content-center align-items-center"><h1 class="text-center" style="margin-top: 30px">Filtrado de turnos</h1></div>
                    <form action="FiltrarTurnosPorAtendidosSv" method="get" accept-charset="UTF-8">
                        <div class="form-group" style="margin-top: 50px">
                            <label for="consultaFecha">Fecha:</label>
                            <input type="date" class="form-control" id="datePickerId2" name="fecha" required>
                            <br>
                            <label for="consultaApellido" style="padding-right: 10px">Estado:</label>
                            <select name="miSelect">
                                <option value="false">En espera</option>
                                <option value="true">Ya atendido</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Filtrar</button>
                    </form>

                    <!-- Aquí se mostrará la tabla si hay resultados -->
                    <% if (request.getAttribute("turno") != null) { %>
                    <div class="row">
                        <div class="col-12">
                            <h2 style="text-align: center">Turnos por fecha y estado</h2>
                            <table class="table">
                                <thead class="table-dark">
                                    <tr>
                                        <th class="text-center">Fecha</th>
                                        <th class="text-center">
                                            <%
                                                List<Turno> turnos = (List<Turno>) request.getAttribute("turno");
                                                List<Boolean> aten = new ArrayList();
                                                for (Turno turno : turnos) {
                                                    aten.add(turno.isAtendido());
                                                }
                                                if (turnos != null && !turnos.isEmpty()) {
                                                    out.print(turnos.get(0).getFechaTurno() != null ? turnos.get(0).getFechaTurno() : "No turnos");
                                                }
                                            %>
                                        </th>
                                    </tr>
                                </thead>
                                <thead class="table-dark">
                                    <tr>
                                        <th class="text-center">cod</th>
                                        <th class="text-center">Turno</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Tramite</th>
                                        <th class="text-center">Atendido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Turno turno : ((List<Turno>) turnos)) {%>
                                    <tr>
                                        <td class="text-center"><%= turno.getId()%></td>
                                        <td class="text-center"><%= turno.getNumero()%></td>
                                        <td class="text-center"><%= turno.getUnCiudadano().getNombre()%></td>
                                        <td class="text-center"><%= turno.getUnTramite().getDescripcion()%></td>
                                        <td class="text-center"> <%= turno.isAtendido() ? "Si" : "No"%> </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
        <script>
            var hoy = new Date();
            hoy.setDate(hoy.getDate() + 1);
            document.getElementById("datePickerId2").min = hoy.toISOString().split("T")[0];
        </script>

    </body>
</html>
