package com.citonline.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.citonline.db.interfaces.DeferralDAO;
import com.citonline.db.interfaces.StudentDAO;
import com.citonline.domain.Deferral;
import com.citonline.domain.Student;
/**
 * 
 * @author peter halligan
 * 27/12/14
 * 
 *
 */
@Controller 
@RequestMapping("/deferral")
public class DeferralController 
{

	@Autowired
	DeferralDAO deferralDAO;
	
	@RequestMapping(value="/deferralStatus/{status}", method=RequestMethod.GET)
	public String getlDefferalStatus(@PathVariable("status") int status, ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getDefferalsStatus(status);
		model.addAttribute("message", "this is the deferalStatus page");
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	@RequestMapping(value="/listDeferralStatus/{status}/", method=RequestMethod.GET)
	public String getDefferalByStatusName(@PathVariable("status") String status, ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getDefferalsStatusName(status);
		
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	@RequestMapping(value="/listName/{firstName}/{lastName}", method=RequestMethod.GET)
	public String getDefferalByName(@PathVariable("firstName") String firstName,@PathVariable("lastName") String lastName, ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getDeferralsStudentName(firstName, lastName);
		
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	@RequestMapping(value="/listStudentNumber/{studentNumber}/", method=RequestMethod.GET)
	public String getDefferalByName(@PathVariable("studentNumber") String studentNumber, ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getDeferralsStudentNumber(studentNumber);
		
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	
	@RequestMapping(value="/deleteDeferral", method=RequestMethod.GET)
	//public String delete(@PathVariable int id, ModelMap model){
	public String delete(ModelMap model){
		//Deferral deferral = deferralDAO.getDeferralById(id);
		//deferralDAO.deleteDeferral(id);
		
		//model.addAttribute("Delete", "Deferral with id "+ id);
		//model.addAttribute("Student number", deferral.getStudent());
		//model.addAttribute("program number", deferral.getProgram());
		model.addAttribute("message", "Deletingshit");
	    return "deleteDeferral";
	}
	
	@RequestMapping(value = "/addNewDeferral", method = RequestMethod.GET) 
	public ModelAndView addNewDeferral() {                                
		return new ModelAndView("addNewDeferral", "deferral", new Deferral());
	} 
	
	@RequestMapping(value = "/addNewDeferral", method = RequestMethod.POST)
	public String displaySongwriter(@ModelAttribute("deferral") Deferral deferral, ModelMap model) {
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		   Date date = new Date();
		   String today = dateFormat.format(date).toString();
	 

		model.addAttribute("deferral_date", today);
		model.addAttribute("id_student", deferral.getId_student());
		model.addAttribute("id_program", deferral.getId_program());
		model.addAttribute("program_deferred", deferral.getProgramDeferred());	
		
		
		try {
			deferralDAO.createDeferral(today, deferral.getId_program(), deferral.getId_student(), deferral.getProgramDeferred(), 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//model.addAttribute("deferral", deferral);
		return "displayDeferral";
	}
	@RequestMapping(value = "/modifyDeferral", method = RequestMethod.GET) 
	public String updateDeferralStatusByName()
	{
		return "modifyDeferral";
	}
	@RequestMapping(value = "/getStudent", method = RequestMethod.GET) 
	public String getStudent()
	{
		StudentDAO student = new StudentDAO();
		ArrayList<Student> students = new ArrayList<Student>();
			students = 	student.listStudents();
		return "displayStudent";
	}
	
}