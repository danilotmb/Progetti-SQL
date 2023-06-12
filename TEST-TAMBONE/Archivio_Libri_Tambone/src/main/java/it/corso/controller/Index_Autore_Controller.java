package it.corso.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.corso.model.Autore;
import it.corso.service.AutoreService;

@Controller
@RequestMapping("/autori")
public class Index_Autore_Controller 
{
	@Autowired
	private AutoreService autoreService;
	
	@GetMapping
	public String getPage (Model model)
	{
		List<Autore> autori = autoreService.getAutori();
		model.addAttribute("autori", autori);
		
		return "indexautori";
	}
	
	
	@GetMapping("/cancellaautore")
	public String cancellaAutore (@RequestParam("id") int id)
	{
		Autore autore = autoreService.getAutoreById(id);
		autoreService.cancellaAutore(autore);
		
		return "redirect:/autori";
	}
	
	
}
