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

import it.corso.model.Autore;
import it.corso.service.AutoreService;

@Controller
@RequestMapping("/registraautore")
public class Form_Autore_Controller 
{
	@Autowired
	private AutoreService autoreService;
	
	@GetMapping
	public String getPage(
			Model model,
			@RequestParam(name = "id", required = false)Integer id)
	{
		Autore autore = id == null ? new Autore() : autoreService.getAutoreById(id);
		model.addAttribute("autore", autore);
		
		return "formautori";
	}
	
	@PostMapping
	public String registraAutore(
				@ModelAttribute("autore") Autore autore,
				BindingResult result)
	{
		if(result.hasErrors())
			return "registraautore";
		
		autoreService.registraAutore(autore);
		
		return "redirect:/autori";
	}
}
