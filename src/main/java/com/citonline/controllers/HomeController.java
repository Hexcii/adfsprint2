/**
 * @author Fabien
 *
 * @since 25 nov. 2014
 */
package com.citonline.controllers;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Fabien
 *
 */
@Controller
public class HomeController {

	@RequestMapping(value={"/","/home"})
	public String showHomePage(ModelMap model) { 
		Date date = new java.util.Date();		
		model.addAttribute("message", "This is CIT Online home page.");
		model.addAttribute("now", date);
		return "home";
	}
}
