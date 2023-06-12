package it.corso.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import it.corso.model.Libro;

@Repository
public interface LibroDao extends CrudRepository<Libro, Integer>
{

}
