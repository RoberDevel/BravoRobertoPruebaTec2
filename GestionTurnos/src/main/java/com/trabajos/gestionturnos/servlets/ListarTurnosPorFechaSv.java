/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.trabajos.gestionturnos.servlets;

import com.trabajos.gestionturnos.logic.entity.Controladora;
import com.trabajos.gestionturnos.logic.entity.Turno;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ListarTurnosPorFechaSv", urlPatterns = {"/ListarTurnosPorFechaSv"})
public class ListarTurnosPorFechaSv extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        List<Turno> turnos = controladora.mostrarTurnosPorFecha(request.getParameter("consultaFecha"));

        turnos.forEach(t -> System.out.println(t.getFechaTurno()));

        request.setAttribute("turno", turnos);
        request.getRequestDispatcher("listarTurnosPorFecha.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
