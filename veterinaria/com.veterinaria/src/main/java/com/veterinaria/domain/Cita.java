/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

/**
 *
 * @author valed
 */
@Data
@Entity
@Table(name = "cita")

public class Cita implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column (name = "id_cita")
    private Long idCita;
    private String descripcion;
    private String fecha_cita;
    private int hora_cita;
    private String nombre_usuario;
    private String nombre_mascota;
    private String rutaImagen;
    private boolean activo;

    @OneToMany
    @JoinColumn(name="id_cita")
    List<Producto> productos;
    public Cita(){
    
    }
    
    public Cita(String descripcion, String fecha_cita, int hora_cita, String nombre_usuario, String nombre_mascota, String rutaImagen, boolean activo) {
        this.descripcion = descripcion;
        this.fecha_cita = fecha_cita;
        this.hora_cita = hora_cita;
        this.nombre_usuario = nombre_usuario;
        this.nombre_mascota = nombre_mascota;
        this.rutaImagen = rutaImagen;
        this.activo = activo;
    }

    
}

