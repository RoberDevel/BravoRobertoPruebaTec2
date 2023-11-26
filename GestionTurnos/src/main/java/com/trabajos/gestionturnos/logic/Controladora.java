/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.trabajos.gestionturnos.logic;

import com.trabajos.gestionturnos.persistence.ControladoraPersistencia;

/**
 *
 * @author rober
 */
public class Controladora {

    ControladoraPersistencia controladora = new ControladoraPersistencia();

    public void crearTurno(Turno turno) {
        controladora.crearTurno(turno);
    }

    public void crearCiudadano(Ciudadano ciudadano) {
        controladora.crearCiudadano(ciudadano);
    }
}
