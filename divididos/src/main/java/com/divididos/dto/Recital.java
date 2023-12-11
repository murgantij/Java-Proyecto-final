package com.divididos.dto;

import java.util.Date;

public class Recital {
	private Long idRecital; 
	private String fecha;
	private Float precio; 
	private Estadio estadio;
	
    public Recital(Long idRecital, String fecha, Float precio, Estadio estadio) {
        this.idRecital = idRecital;
        this.fecha = fecha;
        this.precio = precio;
        this.estadio = estadio;
    }

    public Long getIdRecital() {
        return idRecital;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Estadio getEstadio() {
        return estadio;
    }

    public void setEstadio(Estadio estadio) {
        this.estadio = estadio;
    }

      
}
