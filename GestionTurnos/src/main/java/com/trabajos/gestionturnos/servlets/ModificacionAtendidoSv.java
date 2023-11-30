package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.Controladora;
import com.trabajos.gestionturnos.logic.Turno;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModificacionAtendidoSv", urlPatterns = {"/ModificacionAtendidoSv"})
public class ModificacionAtendidoSv extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        Turno turno = controladora.traerTurno(Long.valueOf(request.getParameter("idC")));

        request.setAttribute("turno", turno);
        request.getRequestDispatcher("modificacionAtendido.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        Turno turno = controladora.traerTurno(Long.valueOf(request.getParameter("turnoId")));

        boolean esAtendido = Boolean.parseBoolean(request.getParameter("atendido"));

        esAtendido = !(esAtendido);

        turno.setAtendido(esAtendido);

        try {
            controladora.modificarTurno(turno);
        } catch (Exception ex) {
            Logger.getLogger(ModificacionAtendidoSv.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("modificacionAtendido.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
