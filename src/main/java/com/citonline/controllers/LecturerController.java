/**
 * @author Fabien
 *
 * @since 4 déc. 2014
 */
package com.citonline.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.citonline.db.interfaces.LecturerDAO;
import com.citonline.interfaces.impl.LecturerImpl;


/**
 * @author Fabien
 *
 */
@Controller
@RequestMapping("/lecturer")
public class LecturerController {
	
	@Autowired
	LecturerDAO lecturerDAO;
	
	@RequestMapping(value="/listall", method = RequestMethod.GET)
	public String listAll(ModelMap model) {
			
			List<LecturerImpl> listLecturers=lecturerDAO.listLecturers();
			model.addAttribute("lecturers", listLecturers);
		    return "displayLecturers";
		}
	
	@RequestMapping(value="/list/{firstName}/{lastName}", method=RequestMethod.GET)
	 public String listLecturerByFistnameLastname(@PathVariable String firstName, @PathVariable String lastName,  ModelMap model){
		LecturerImpl lecturer=lecturerDAO.getLecturer(firstName, lastName);
		List<LecturerImpl> listLecturers = new ArrayList<LecturerImpl>();
		listLecturers.add(lecturer);
		
		model.addAttribute("lecturers", listLecturers);
	    return "displayLecturers";
	}
	
	@RequestMapping(value="/list/{id}", method=RequestMethod.GET)
	public String listLecturerByID(@PathVariable int id, ModelMap model){
		List<LecturerImpl> lecturers=new ArrayList<LecturerImpl>();
		LecturerImpl lecturer=lecturerDAO.getLecturer(id);
		lecturers.add(lecturer);
		model.addAttribute("lecturers", lecturers);
	    return "displayLecturers";
	}
	
	@RequestMapping(value="/modify/{id}", method=RequestMethod.GET)
	public String modifyLecturerByID(@PathVariable int id, ModelMap model){
		List<LecturerImpl> lecturers=new ArrayList<LecturerImpl>();
		LecturerImpl lecturer=lecturerDAO.getLecturer(id);
		lecturers.add(lecturer);
		model.addAttribute("lecturers", lecturers);
	    return "displayLecturers";
	}
}