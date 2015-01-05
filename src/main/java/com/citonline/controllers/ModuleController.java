package com.citonline.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.citonline.db.interfaces.ModuleDAO;
import com.citonline.domain.Module;
import com.citonline.interfaces.impl.LecturerImpl;
import com.citonline.interfaces.impl.ModuleImpl;
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
	
	@RequestMapping(value = "/createModule", method = RequestMethod.GET) 
	public ModelAndView createModule() {                                
		return new ModelAndView("createModule", "module", new Module());
	} 
	
	@RequestMapping(value = "/createModule", method = RequestMethod.POST)
	public String display(@ModelAttribute("module") Module module, ModelMap model) {

		model.addAttribute("id_module", module.getId());
		model.addAttribute("code_module", module.getCode());
		model.addAttribute("crn_module", module.getCrn());
		model.addAttribute("name_module", module.getName());
		model.addAttribute("semester_module", module.getSemester());	
		
		try {
			moduleDAO.createModule(module.getCode(), module.getCrn(), module.getName(), module.getSemester());
		} catch (Exception e) {
			e.printStackTrace();
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