package it.corso.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import it.corso.model.Libro;
import it.corso.service.LibroService;

@Controller
@RequestMapping("/registralibro")
public class Form_Libri_Controller
{
	@Autowired
	private LibroService libroService;
	
	@GetMapping
	public String getPage()
	{
		return "formlibri";
	}
	
	@PostMapping
	public String registraLibro(
			@RequestParam(name = "file", required = false) MultipartFile copertina,
			@ModelAttribute("libro") Libro libro
			)
	{
		
		libroService.registraLibro(libro, copertina);
		return "redirect:/libri";
	}
}