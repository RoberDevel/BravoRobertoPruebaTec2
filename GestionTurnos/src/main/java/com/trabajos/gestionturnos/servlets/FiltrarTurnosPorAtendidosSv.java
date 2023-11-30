/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.entity.Controladora;
import com.trabajos.gestionturnos.logic.entity.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rober
 */
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
        //  processRequest(request, response);
        String esAtendido = request.getParameter("miSelect");
        String fecha = request.getParameter("fecha");

        List<Turno> turnos = controladora.mostrarTurnosPorAtendido(fecha, esAtendido);

        request.setAttribute("turno", turnos);
        request.getRequestDispatcher("listarTurnosPorAtendidos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
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
    }// </editor-fold>

}
