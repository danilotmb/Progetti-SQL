package it.corso.service;

import java.util.List;

import it.corso.model.Libro;

public interface LibroService 
{
	void registraLibro (Object...dati);
	
	Libro getLibroById (int id);
	
	List<Libro> getLibri();
	
	void cancellaLibro (Libro libro);
}
