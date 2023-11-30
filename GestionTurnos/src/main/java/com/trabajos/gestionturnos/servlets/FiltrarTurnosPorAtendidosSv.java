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

        String[] turnoIdValues = request.getParameterValues("turnoId");
        for (int i = 0; i < turnoIdValues.length; i++) {
            String turnoIdValues2 = turnoIdValues[i];
            System.out.println("id nuevo -> " + turnoIdValues2);
        }
        String[] atendidoValues = request.getParameterValues("atendido");
        for (int i = 0; i < atendidoValues.length; i++) {
            String atendidoValues1 = atendidoValues[i];
            System.out.println("atendido nuevo -> " + atendidoValues1);
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
