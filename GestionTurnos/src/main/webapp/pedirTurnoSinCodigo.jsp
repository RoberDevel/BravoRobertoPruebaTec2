
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedir Turno</title>
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
        <div class="row" style="height: 100%;">
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
                        <a href="pedirTurnoSinCodigo.jsp" class="nav-link active text-white">

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

                    <form class="row g-3 needs-validation" action="TurnoSinCodigoSv" method="post"  novalidate style="margin: 10px;">
                        <div class="col-md-6">
                            <label for="validationCustom01" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required minlength="3">
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom02" class="form-label">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido"  required minlength="3">
                        </div>

                        <div class="col-md-6">
                            <label for="validationCustom03" class="form-label">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" required minlength="8" maxlength="13">
                        </div>
                        <div class="col-md-6">
                            <label for="validationCustom03" class="form-label">DNI</label>
                            <input type="text" class="form-control" id="dni" name="dni" required minlength="8" maxlength="10">
                            <!-- <div class="invalid-feedback">
                                Please provide a valid city.
                            </div> -->
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Tramite</label>
                            <input type="text" class="form-control" id="tramite" name="tramite" required minlength="3">
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Fecha</label>
                            <input type="date" class="form-control" id="datePickerId" name="fecha" required>
                        </div>

                        <div class="col-12">
                            <button class="btn btn-primary" type="submit" >Pedir turno</button>
                        </div>
                    </form>
                    <script>

                        (() => {
                            'use strict'

                            // Fetch all the forms we want to apply custom Bootstrap validation styles to
                            const forms = document.querySelectorAll('.needs-validation')

                            // Loop over them and prevent submission
                            Array.from(forms).forEach(form => {
                                form.addEventListener('submit', event => {
                                    if (!form.checkValidity()) {
                                        event.preventDefault()
                                        event.stopPropagation()
                                    }

                                    form.classList.add('was-validated')
                                }, false)
                            })
                        })()

                    </script>
                    <script>
                        var hoy = new Date();
                        hoy.setDate(hoy.getDate() + 1);
                        document.getElementById("datePickerId").min = hoy.toISOString().split("T")[0];
                    </script>

                </div>
            </div>
        </div>
    </body>
</html>
