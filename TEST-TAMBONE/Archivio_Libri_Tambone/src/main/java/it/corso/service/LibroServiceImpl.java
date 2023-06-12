package it.corso.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;

import it.corso.dao.LibroDao;
import it.corso.model.Libro;


@Service
public class LibroServiceImpl implements LibroService 
{
	@Autowired
	private LibroDao libroDao;
	
	
	
	@Override
	public void registraLibro(Object...dati) 
	{
		Libro libro = (Libro) dati[0];
		MultipartFile copertina = (MultipartFile) dati[1];
		if(copertina != null && !copertina.isEmpty())
			try
			{
				libro.setCopertina("data:image/png;base64," + Base64Utils.encodeToString(copertina.getBytes()));
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		libroDao.save(libro);
		
	}

	@Override
	public Libro getLibroById(int id) 
	{
		return libroDao.findById(id).get();
	}

	@Override
	public List<Libro> getLibri() 
	{
		return (List<Libro>) libroDao.findAll();
	}

	@Override
	public void cancellaLibro(Libro libro) 
	{
		libroDao.delete(libro);
	}

}
