/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.veterinaria.dao;

import com.veterinaria.domain.Cita;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author valed
 */
public interface CitaDao extends JpaRepository<Cita, Long> {

}
