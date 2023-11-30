package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.entity.Ciudadano;
import com.trabajos.gestionturnos.logic.entity.Controladora;
import com.trabajos.gestionturnos.logic.entity.Tramite;
import com.trabajos.gestionturnos.logic.entity.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnoConCodigoSv", urlPatterns = {"/TurnoConCodigoSv"})
public class TurnoConCodigoSv extends HttpServlet {

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
        // processRequest(request, response);

        String fechaStr = request.getParameter("fecha");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fecha = LocalDate.parse(fechaStr, formatter);

        Turno turno = new Turno();
        turno.setFechaTurno(fecha);
        Tramite tramite = new Tramite();
        tramite.setDescripcion(request.getParameter("tramite"));
        //  controladora.crearTurno(turno);

        String cod = request.getParameter("codigo");
        Long codigo = Long.parseLong(cod);

        if (controladora.crearTurnoConCodigo(codigo, turno, tramite)) {
            request.setAttribute("codigo", turno.getUnCiudadano().getId());
            request.setAttribute("numero", turno.getNumero());
            request.setAttribute("fecha", turno.getFechaTurno());
            request.setAttribute("nombre", turno.getUnCiudadano().getNombre());
            request.setAttribute("apellido", turno.getUnCiudadano().getApellido());

            RequestDispatcher dispatcher = request.getRequestDispatcher("Resultado2.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
