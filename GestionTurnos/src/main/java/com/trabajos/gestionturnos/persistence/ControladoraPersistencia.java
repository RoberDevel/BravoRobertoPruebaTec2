package com.trabajos.gestionturnos.persistence;

import com.trabajos.gestionturnos.logic.Ciudadano;
import com.trabajos.gestionturnos.logic.Turno;

public class ControladoraPersistencia {

    TurnoJpaController turnoJpa = new TurnoJpaController();
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();

    public void crearTurno(Turno turno) {
        turnoJpa.create(turno);
    }

    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }
}
