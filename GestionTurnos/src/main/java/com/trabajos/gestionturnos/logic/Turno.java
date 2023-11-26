package com.trabajos.gestionturnos.logic;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Turno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.DATE)
    private Date fechaTurno;
    private String horaTurno;
    @ManyToOne
    @JoinColumn(name = "ciudadano_id")
    private Ciudadano ciudadano;

    @OneToOne(mappedBy = "turno")
    private Tramite tramite;
    private boolean atendido;

    public Turno() {
    }

    public Turno(Date fechaTurno, String horaTurno, Ciudadano unCiudadano, Tramite unTramite, boolean atendido) {

        this.fechaTurno = fechaTurno;
        this.horaTurno = horaTurno;
        this.ciudadano = unCiudadano;
        this.tramite = unTramite;
        this.atendido = atendido;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFechaTurno() {
        return fechaTurno;
    }

    public void setFechaTurno(Date fechaTurno) {
        this.fechaTurno = fechaTurno;
    }

    public String getHoraTurno() {
        return horaTurno;
    }

    public void setHoraTurno(String horaTurno) {
        this.horaTurno = horaTurno;
    }

    public Ciudadano getUnCiudadano() {
        return ciudadano;
    }

    public void setUnCiudadano(Ciudadano unCiudadano) {
        this.ciudadano = unCiudadano;
    }

    public Tramite getUnTramite() {
        return tramite;
    }

    public void setUnTramite(Tramite unTramite) {
        this.tramite = unTramite;
    }

    public boolean isAtendido() {
        return atendido;
    }

    public void setAtendido(boolean atendido) {
        this.atendido = atendido;
    }

}
