package it.corso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.corso.model.Categoria;
import it.corso.service.CategoriaService;

@Controller
@RequestMapping("/registracategoria")
public class Form_Categorie_Controller 
{
	@Autowired
	private CategoriaService categoriaService;
	
	@GetMapping
	public String getPage(
			Model model,
			@RequestParam(name = "id", required = false) Integer id)
	{
		Categoria categoria = id == null ? new Categoria() : categoriaService.getCategoriaById(id);
		model.addAttribute("categoria", categoria);
		
 		return "formcategorie";
	}
	
	
	@PostMapping
	public String registraCategoria (
			@ModelAttribute("categoria") Categoria categoria,
			BindingResult result)
	{
		if(result.hasErrors())
			return "registracategoria";
		
		categoriaService.registraCategoria(categoria);
		
		return "redirect:/categorie";
	}
	
}
