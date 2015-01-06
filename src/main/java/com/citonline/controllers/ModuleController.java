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

import com.citonline.db.interfaces.ModuleDAO;
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
	
	@RequestMapping(value={"/displayModules"}, method = RequestMethod.GET)
	public String listAll(ModelMap model) {
			List<ModuleImpl> listModules = moduleDAO.listModules();
			model.addAttribute("modules", listModules);
		    return "displayModules";
	}
	
	@RequestMapping(value="/displayModule", method=RequestMethod.GET)
	 public String getModulebyCrn(ModelMap model){
	    return "displayModule";
	}
	
	@RequestMapping(value="/displayModule/crn/{crn}", method=RequestMethod.GET)
	 public String displayModulebyCrn(@PathVariable String crn,
			 ModelMap model){
		ModuleImpl module=moduleDAO.getModule(crn);		
		model.addAttribute("module", module);
	    return "displayModule";
	}	
	
	@RequestMapping(value = "/addModule", method = RequestMethod.GET) 
	public String addModule(ModelMap model) {                                  
		model.addAttribute("module", new ModuleImpl());
		return "addModule";
	} 
	
	@RequestMapping(value = "/addModule", method = RequestMethod.POST)
	public String displayModule(@ModelAttribute("module") @Valid ModuleImpl module,
			BindingResult result, ModelMap model) {
		if(result.hasErrors())
			return "addModule"; 
		            try {   		            	
			        	moduleDAO.createModule(module.getCode(), module.getCrn(), module.getName(), module.getSemester());
		            } catch (Exception e) {
		            	model.addAttribute("message", "Creation of module failed, "+e.getLocalizedMessage());
						return "errorModule"; 
		            }
		           model.addAttribute(module);
		return "displayModule";
	}	
	
	@RequestMapping(value="/modifyModule", method = RequestMethod.GET)
	public String modifyModule(ModelMap model) {
		List<ModuleImpl> modules=moduleDAO.listModules();
		model.addAttribute("modules", modules);
		return "modifyModule";
	}
	
	@RequestMapping(value ="/modifyModuleForm/crn/{crn}", method = RequestMethod.GET)
	public String modifyModuleByCrn(@PathVariable String crn, ModelMap model) {
		ModuleImpl moduleModify=moduleDAO.getModule(crn);
		model.addAttribute("message", "Module with crn "+ crn +" can now be modified");
		model.addAttribute("module", moduleModify);
		return "modifyModuleForm";
	}

	@RequestMapping(value ="/modifyModuleForm/code/{code}/crn/{crn}/name/{name}/semester/{semester}", method = RequestMethod.GET)
	public String modifyModuleByCrn(@PathVariable String crn,
			@PathVariable String name,@PathVariable String code,@PathVariable int semester, ModelMap model) {
		moduleDAO.updateModule(crn, name, code, semester);
		ModuleImpl moduleModify=moduleDAO.getModule(name);
		model.addAttribute("message", "Module " + moduleModify.getName() + " has been successfully updated");
		model.addAttribute("module", moduleModify);
		return "displayModule";
	}
	
	@RequestMapping(value = "/deleteModule", method = RequestMethod.GET) 
	public String deleteModule(ModelMap model) {
		List<ModuleImpl> listModules=moduleDAO.listModules();
		model.addAttribute("modules", listModules);		
		return "deleteModule";
	}
	
	@RequestMapping(value ="/deleteModule/crn/{crn}", method = RequestMethod.GET) 
	public String deleteModuleByCrn(@PathVariable String crn, ModelMap model) { 
		ModuleImpl moduleDelete=moduleDAO.getModule(crn);
		moduleDAO.deleteModule(crn);
		model.addAttribute("message", "Module:" + moduleDelete.getName() + " CRN:" +
				moduleDelete.getCrn() + " has been deleted from the system");
		model.addAttribute("code", moduleDelete.getCode());
		model.addAttribute("name", moduleDelete.getName());
		model.addAttribute("semester", moduleDelete.getSemester());
		model.addAttribute("crn", moduleDelete.getCrn());
		List<ModuleImpl> listModules = moduleDAO.listModules();
		model.addAttribute("modules", listModules);	
		return "deleteModule";
	}

}
