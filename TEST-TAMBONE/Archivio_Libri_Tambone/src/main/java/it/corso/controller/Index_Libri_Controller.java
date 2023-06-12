package it.corso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.corso.model.Libro;
import it.corso.service.LibroService;

@Controller
@RequestMapping("/libri")
public class Index_Libri_Controller 
{
	@Autowired
	private LibroService libroService;
	
	private Libro libro;
	
	@GetMapping
	public String getPage(Model model,
		@RequestParam(name = "id", required = false) Integer id) {
		
		
		libro = id==null ? new Libro() : libroService.getLibroById(id);
		
		model.addAttribute("libro", libro);
	
		model.addAttribute("libri", libroService.getLibri());
		
		return "indexlibri";
	}
	
	@GetMapping("/cancellalibri")
	public String cancellaLibri (@RequestParam("id") int id)
	{
		Libro libro = libroService.getLibroById(id);
		libroService.cancellaLibro(libro);
		
		return "redirect:/libri";
	}
}
