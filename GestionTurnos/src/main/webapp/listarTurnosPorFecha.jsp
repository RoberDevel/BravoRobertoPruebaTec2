<%--
    Document   : prueba
    Created on : 28 nov 2023, 21:26:15
    Author     : rober
--%>

<%@page import="com.trabajos.gestionturnos.logic.entity.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>turnos por fecha</title>
        <link rel="stylesheet" href="css/bootstrap5.min.css"/>
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
            <div class="col-4 p-3 text-white bg-dark" style="width: 310px;">
                <span class="fs-4">Turnero</span>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link text-white" aria-current="page">
                            Inicio
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoConCodigo.jsp" class="nav-link text-white">

                            Pedir turno con código de usuario
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="pedirTurnoSinCodigo.jsp" class="nav-link  text-white">

                            Pedir turno sin código de usuario
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="listarTurnosPorFecha.jsp" class="nav-link active text-white">
                            Listar turnos por Fecha
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="listarTurnosPorAtendidos.jsp" class="nav-link text-white">
                            Filtrado de turnos
                        </a>
                    </li>
                    <hr>
                    <li>
                        <a href="modificacionAtendido.jsp" class="nav-link text-white">
                            Modificar atendido
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
                            <h3>Turnos por fecha</h3>
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
                                        <th>Turno</th>
                                        <th>Ciudadano</th>
                                        <th>Tramite</th>
                                        <th>Atendido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Turno turno : ((List<Turno>) request.getAttribute("turno"))) {%>
                                    <tr>

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
