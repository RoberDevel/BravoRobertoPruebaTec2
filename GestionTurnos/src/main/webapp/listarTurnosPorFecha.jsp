<%@page import="com.trabajos.gestionturnos.logic.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>turnos por fecha</title>
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
                        <div id="miMensaje" style="display: none; position: absolute; background-color: #86b7fe; padding: 10px; border: 1px solid #d4d4d4; border-radius: 5px; z-index: 1;">
                            Necesitas crear un turno sin código de usuario primero
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
                        <a href="listarTurnosPorFecha.jsp" class="nav-link text-white active"><i class="bi bi-file-medical"></i>
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

                    <div class="row justify-content-center align-items-center"><h1 class="text-center" style="margin-top: 30px">Mis turnos</h1></div>
                    <h3 class="text-center" style="margin-top: 20px">Consultar por fecha</h3>
                    <form action="ListarTurnosPorFechaSv" method="get" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="consultaFecha">Consultar por Fecha:</label>
                            <input type="date" class="form-control" id="datePickerId3" name="consultaFecha" required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-top: 10px">Buscar</button>
                    </form>

                    <!-- Aquí se mostrará la tabla si hay resultados -->
                    <% if (request.getAttribute("turno") != null) {%>
                    <div class="row" >

                        <div class="col-12" style="margin-top: 20px">
                            <h3 style="text-align: center">Turnos por fecha</h3>
                            <table class="table">
                                <thead class="table-dark">
                                    <tr>
                                        <th >Fecha</th>
                                        <th>
                                            <%
                                                List<Turno> turnos = (List<Turno>) request.getAttribute("turno");
                                                if (turnos != null && !turnos.isEmpty()) {
                                                    out.print(turnos.get(0).getFechaTurno() != null ? turnos.get(0).getFechaTurno() : "");
                                                }
                                            %>
                                        </th>
                                    </tr>
                                </thead>
                                <thead>
                                    <tr>
                                        <th>cod</th>
                                        <th>Turno</th>
                                        <th>Ciudadano</th>
                                        <th>Tramite</th>
                                        <th>Atendido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Turno turno : ((List<Turno>) request.getAttribute("turno"))) {%>
                                    <tr>
                                        <td><%= turno.getId()%></td>
                                        <td><%= turno.getNumero()%></td>
                                        <td><%= turno.getUnCiudadano().getNombre()%></td>
                                        <td><%= turno.getUnTramite().getDescripcion()%></td>
                                        <td><%= turno.isAtendido() ? "Sí" : "No"%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>

                        </div>
                        <% }%>
                    </div>

                </div>
            </div>
        </div>

        <script>
            var hoy = new Date();
            hoy.setDate(hoy.getDate() + 1);
            document.getElementById("datePickerId3").min = hoy.toISOString().split("T")[0];
        </script>

    </body>
</html>
