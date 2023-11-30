package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.Controladora;
import com.trabajos.gestionturnos.logic.Turno;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FiltrarTurnosPorAtendidosSv", urlPatterns = {"/FiltrarTurnosPorAtendidosSv"})
public class FiltrarTurnosPorAtendidosSv extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String esAtendido = request.getParameter("miSelect");
        String fecha = request.getParameter("fecha");

        List<Turno> turnos = controladora.mostrarTurnosPorAtendido(fecha, esAtendido);

        request.setAttribute("turno", turnos);
        request.getRequestDispatcher("listarTurnosPorAtendidos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
