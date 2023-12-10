/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.veterinaria.service;

import com.veterinaria.domain.Cita;
import java.util.List;

/**
 *
 * @author valed
 */
public interface CitaService {
    
    // El siguiente metodo retorna una lista con las citas 
    //que estan en la tabla cita,todas o solo los activos
    public List<Cita>getCitas(boolean activos);
    
    //Aca siguen los metodos para hacer un CRUD de la tabla citas
    
     // Se obtiene un Cita, a partir del id de un cita
    public Cita getCita(Cita cita);
    
    // Se inserta un nuevo cita si el id del cita esta vacío
    // Se actualiza un cita si el id del cita NO esta vacío
    public void save(Cita cita);
    
    // Se elimina el cita que tiene el id pasado por parámetro
    public void delete(Cita cita);
    
}
