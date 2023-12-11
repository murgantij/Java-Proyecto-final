package com.divididos.dto;

public class Estadio {
	private Long idEstadio; 
	private String nombre;
	private String calle;
	private Long numero; 
	private Provincia provincia; 

    public Estadio(Long idEstadio, String nombre, String calle, Long numero, Provincia provincia) {
        this.idEstadio = idEstadio;
        this.nombre = nombre;
        this.calle = calle;
        this.numero = numero;
        this.provincia = provincia;
    }

    public Long getIdEstadio() {
        return idEstadio;
    }
    
    public void setIdEstadio(Long idEstadio) {
        this.idEstadio = idEstadio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public Provincia getProvincia() {
        return provincia;
    }

    public void setProvincia(Provincia provincia) {
        this.provincia = provincia;
    }
    
    public String getDireccion() {
        return calle + ' ' + numero;
    }


   


        
	
	}
