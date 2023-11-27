package com.veterinaria.dao;

import com.veterinaria.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author PC MASTER
 */
public interface CategoriaDao extends JpaRepository<Categoria, Long> {

}
