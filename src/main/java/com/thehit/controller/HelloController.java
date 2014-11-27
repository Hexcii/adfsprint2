package com.thehit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HelloController {

	@RequestMapping(value={"/","/home"}) 	
	public String showHomePage(ModelMap model) {
		model.addAttribute("message", "This is TheHits home page."); 
		return "home"; 
	} 
}