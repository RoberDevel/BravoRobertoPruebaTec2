package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.entity.Ciudadano;
import com.trabajos.gestionturnos.logic.entity.Controladora;
import com.trabajos.gestionturnos.logic.entity.Tramite;
import com.trabajos.gestionturnos.logic.entity.Turno;
import java.io.IOException;
import java.io.PrintWriter;
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
        // ciudadano.setNombre("rober");
        // ciudadano.setApellido("apellidido");
        // ciudadano.setDni("3333333g");
        // ciudadano.setTelefono("666666666");
        Turno turno = new Turno();
        // turno.setNumero(5);
        // turno.setFechaTurno(LocalDate.now());
        // turno.setAtendido(true);
        //  turno.setHoraTurno("10:30");
        Tramite tramite = new Tramite();
        //  tramite.setDescripcion("tramite 1");

        String fechaStr = request.getParameter("fecha");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fecha = LocalDate.parse(fechaStr, formatter);
        ciudadano.setNombre(request.getParameter("nombre"));
        ciudadano.setApellido(request.getParameter("apellido"));
        ciudadano.setTelefono(request.getParameter("telefono"));
        ciudadano.setDni(request.getParameter("dni"));
        turno.setAtendido(false);
        turno.setFechaTurno(fecha);
        // turno.setHoraTurno("10:30");
        tramite.setDescripcion(request.getParameter("tramite"));

        controladora.crearTurnoSinCodigo(ciudadano, turno, tramite);
        // controladora.crearCiudadano(ciudadano);
        // turno.setUnCiudadano(ciudadano);
        // controladora.crearTramite(tramite);
        // turno.setUnTramite(tramite);
        // controladora.crearTurno(turno);
        request.setAttribute("codigo", ciudadano.getId());
        request.setAttribute("numero", turno.getNumero());
        request.setAttribute("fecha", turno.getFechaTurno());
        request.setAttribute("nombre", ciudadano.getNombre());
        request.setAttribute("apellido", ciudadano.getApellido());

        RequestDispatcher dispatcher = request.getRequestDispatcher("Resultado.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
