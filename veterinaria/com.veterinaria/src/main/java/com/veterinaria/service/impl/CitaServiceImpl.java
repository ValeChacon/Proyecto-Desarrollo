/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.veterinaria.service.impl;

import com.veterinaria.dao.CitaDao;
import com.veterinaria.domain.Cita;
import com.veterinaria.service.CitaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author valed
 */
@Service
public class CitaServiceImpl implements CitaService {

    //La anotacion autowired crea un unico objeto sin hacer new.
    @Autowired
    private CitaDao citaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Cita> getCitas(boolean activos) {
        var lista = citaDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Cita getCita(Cita cita) {
        return citaDao.findById(cita.getIdCita()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Cita cita) {
        citaDao.save(cita);
    }

    @Override
    @Transactional
    public void delete(Cita cita) {
        citaDao.delete(cita);
    }
}
