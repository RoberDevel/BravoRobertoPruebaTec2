package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.Ciudadano;
import com.trabajos.gestionturnos.logic.Controladora;
import com.trabajos.gestionturnos.logic.Tramite;
import com.trabajos.gestionturnos.logic.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnoSinCodigoSv", urlPatterns = {"/TurnoSinCodigoSv"})
public class TurnoSinCodigoSv extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);

        Ciudadano ciudadano = new Ciudadano();
        Turno turno = new Turno();
        Tramite tramite = new Tramite();
        String fechaStr = request.getParameter("fecha");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fecha = LocalDate.parse(fechaStr, formatter);
        ciudadano.setNombre(request.getParameter("nombre"));
        ciudadano.setApellido(request.getParameter("apellido"));
        ciudadano.setTelefono(request.getParameter("telefono"));
        ciudadano.setDni(request.getParameter("dni"));
        turno.setAtendido(false);
        turno.setFechaTurno(fecha);
        tramite.setDescripcion(request.getParameter("tramite"));

        if (controladora.crearTurnoSinCodigo(ciudadano, turno, tramite)) {
            request.setAttribute("codigo", ciudadano.getId());
            request.setAttribute("numero", turno.getNumero());
            request.setAttribute("id", turno.getId());
            request.setAttribute("fecha", turno.getFechaTurno());
            request.setAttribute("nombre", ciudadano.getNombre());
            request.setAttribute("apellido", ciudadano.getApellido());

            RequestDispatcher dispatcher = request.getRequestDispatcher("resultado.jsp");
            dispatcher.forward(request, response);
        } else {
            Ciudadano ciudadano1 = controladora.mostrarIdCiudadano(request.getParameter("nombre"), request.getParameter("apellido"), request.getParameter("dni"));
            request.setAttribute("ciudadano", ciudadano1);
            request.getRequestDispatcher("errorSinCodigo.jsp").forward(request, response);
            // RequestDispatcher dispatcher = request.getRequestDispatcher("errorSinCodigo.jsp");
            //  dispatcher.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
