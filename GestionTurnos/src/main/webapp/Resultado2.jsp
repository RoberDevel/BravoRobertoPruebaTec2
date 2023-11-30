
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <a href="listarTurnosPorFecha.jsp" class="nav-link text-white">
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


                    <h1 style="text-align: center; margin-top: 20px">Gracias <%= request.getAttribute("nombre")%> <%= request.getAttribute("apellido")%>! Su solicitud se ha completado correctamente!</h1>
                    <br>
                    <br>
                    <label>Fecha de su cita:  <%= request.getAttribute("fecha")%> </label>
                    <hr>
                    <label>Turno: <%= request.getAttribute("numero")%> </label>
                    <br>
                    <br>
                    <br>




                </div>
            </div>

    </body>
</html>
