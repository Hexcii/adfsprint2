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
import com.citonline.db.interfaces.ModuleDAO;
import com.citonline.db.interfaces.StudentDAO;
import com.citonline.domain.Deferral;
import com.citonline.domain.Deferralwrapper;
import com.citonline.domain.Student;
import com.citonline.interfaces.impl.StudentImpl;
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
	@Autowired
	StudentDAO studentdao;
	@Autowired
	ModuleDAO moduledao;
	
	Deferralwrapper deferralwrapper;
	//done
	@RequestMapping(value="/deferralStatus/{status}", method=RequestMethod.GET)
	public String getlDefferalStatus(@PathVariable("status") int status, ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getDefferalsStatus(status);
		model.addAttribute("message", "this is the deferalStatus page");
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	//done
	@RequestMapping(value="/deferralAll", method=RequestMethod.GET)
	public String getAllDefferal(ModelMap model){
		List<Deferral> deferrals=new ArrayList<Deferral>();
		deferrals=deferralDAO.getAllDefferals();
		model.addAttribute("message", "this is the deferal list all page");
		model.addAttribute("deferrals", deferrals);
	    return "displayDeferrals";
	}
	//done
	@RequestMapping(value="/listDeferralStatus/{status}", method=RequestMethod.GET)
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
	public ModelAndView delete(ModelMap model){
		ArrayList<Deferral> deferrals = new ArrayList<Deferral>();
	
		ArrayList<Student> students = new ArrayList<Student>();
		ArrayList<Deferralwrapper> deferralw = new ArrayList<Deferralwrapper>();
		deferralwrapper = new Deferralwrapper();
		deferrals = deferralDAO.getAllDefferals();
		StudentImpl student;
		for (Deferral d: deferrals)
		{
			if(d.getId_deferral_status() != 3)
			{
				student = studentdao.getStudent(d.getId_student());
				deferralwrapper.setFirstName(student.getFirstName());
				deferralwrapper.setLastName(student.getLastName());
				deferralwrapper.setStudentNumber(student.getStudentNumber());
				deferralwrapper.setProgramDeferred(d.getProgramDeferred());
				deferralwrapper.setDeferral_date(d.getDeferral_date());
				deferralwrapper.setId(d.getId());
			}
		}
		model.addAttribute("message", "Deletingshit");
		
		return new ModelAndView("deleteDeferral", "deferralws", deferralwrapper);
	}
	
	@RequestMapping(value = "/addNewDeferral", method = RequestMethod.GET) 
	public ModelAndView addNewDeferral() {                                
		return new ModelAndView("addNewDeferral", "deferral", new Deferral());
	} 
	
	@RequestMapping(value = "/addNewDeferral", method = RequestMethod.POST)
	public String displaySongwriter(@ModelAttribute("deferral") Deferral deferral, ModelMap model) {
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		   Date date = new Date();
		   String today = dateFormat.format(date).toString();	
		
		
		try {
			deferralDAO.createDeferral(today, deferral.getId_program(), deferral.getId_student(), deferral.getProgramDeferred(), 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		deferral.setDeferral_date(today);
		model.addAttribute("deferral", deferral);
		return "displayDeferral";
	}
	
	@RequestMapping(value = "/modifyDeferral", method = RequestMethod.GET) 
	public String updateDeferralStatusByName()
	{
		//deferralDAO.
		return "modifyDeferral";
	}
}