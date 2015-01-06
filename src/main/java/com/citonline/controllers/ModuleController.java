package com.citonline.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.citonline.db.interfaces.ModuleDAO;
import com.citonline.domain.Module;
import com.citonline.interfaces.impl.LecturerImpl;
import com.citonline.interfaces.impl.ModuleImpl;
import com.citonline.interfaces.impl.StudentImpl;
/**
 * 
 * @author tim wallace
 * 04/01/15
 * 
 *
 */
@Controller 
@RequestMapping("/module")
public class ModuleController 
{
	@Autowired
	ModuleDAO moduleDAO;
	
	@RequestMapping(value="/displayModules", method=RequestMethod.GET)
	public String getModule(@PathVariable("crn") String crn, ModelMap model){
		Module module = moduleDAO.getModule(crn);
		model.addAttribute("module", module);
	    return "displayModules";
	}
	
	@RequestMapping(value="/deleteModule", method=RequestMethod.GET)
	//public String delete(@PathVariable String crn, ModelMap model){
	public String deleteModule(ModelMap model){
		//Module module = moduleDAO.getModule(crn);
		//moduleDAO.deleteModule(crn);
		
		//model.addAttribute("Delete", "Module with crn "+ crn);
		model.addAttribute("deleting", "deletingModule");
	    return "deleteModule";
	}
	
	@RequestMapping(value = "/addModule", method = RequestMethod.GET) 
	public String addModule(ModelMap model) {                                  
		model.addAttribute("module", new ModuleImpl());
		return "addModule";
	} 

//	@RequestMapping(value = "/addModule", method = RequestMethod.POST)
//	public String display(@ModelAttribute("module") Module module, ModelMap model) {
//
//		model.addAttribute("id", module.getId());
//		model.addAttribute("code", module.getCode());
//		model.addAttribute("crn", module.getCrn());
//		model.addAttribute("name", module.getName());
//		model.addAttribute("semester", module.getSemester());	
//		
//		try {
//			moduleDAO.createModule(module.getCode(), module.getCrn(), module.getName(), module.getSemester());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "displayModule";
//	}
	
	@RequestMapping(value = "/addModule", method = RequestMethod.POST)
	public String displayModule(@ModelAttribute("module") @Valid ModuleImpl module,
			BindingResult result, ModelMap model) {
		
		if(result.hasErrors())
			return "addModule"; 
				 
		            try {   		            	
		        		model.addAttribute("id", module.getId());
		        		model.addAttribute("code", module.getCode());
		        		model.addAttribute("crn", module.getCrn());
		        		model.addAttribute("name", module.getName());
		        		model.addAttribute("semester", module.getSemester());
		    			
		            } catch (Exception e) {
		            	model.addAttribute("message", "Module adding failed, "+e.getLocalizedMessage());
						return "displayError"; 
		            }
		
		return "displayModule";

	}
	@RequestMapping(value = "/modifyModule", method = RequestMethod.GET) 
	public String updateModule(ModelMap model)
	{
		List<Module> modules = moduleDAO.listModules();
		model.addAttribute("modules", modules);
		return "modifyModule";
	}
}