package it.corso.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.corso.model.Categoria;
import it.corso.service.CategoriaService;

@Controller
@RequestMapping("/categorie")
public class Index_Categorie_Controller 
{
	@Autowired
	private CategoriaService categoriaService;
	
	@GetMapping
	public String getPage (Model model)
	{
		List<Categoria> categorie = categoriaService.getCategorie();
		model.addAttribute("categorie", categorie);
		
		return "indexcategorie";
	}
	
	
	@GetMapping("/cancellacategorie")
	public String cancellaCategorie (@RequestParam("id") int id)
	{
		Categoria categoria = categoriaService.getCategoriaById(id);
		categoriaService.cancellaCategoria(categoria);
		
		return "redirect:/categorie";
	}
	
			
}
