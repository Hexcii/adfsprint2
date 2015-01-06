package com.citonline.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.citonline.db.interfaces.StudentDAO;
import com.citonline.interfaces.impl.StudentImpl;


/**
 * @author Declan
 *
 */

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentDAO studentDAO;
	@Autowired
    private ServletContext servletContext;
	
	@RequestMapping(value={"/displayStudents"}, method = RequestMethod.GET)
	public String listAll(ModelMap model) {
			
			List<StudentImpl> listStudents = studentDAO.listStudents();
			model.addAttribute("students", listStudents);
		    return "displayStudents";
		}
	
	@RequestMapping(value="/displayStudent", method=RequestMethod.GET)
	 public String getStudentByStudentNumber(ModelMap model){
	    return "displayStudent";
	}
	
	@RequestMapping(value="/displayStudent/id/{id}", method=RequestMethod.GET)
	 public String displayStudentByStudentNumber(@PathVariable int id,
			 ModelMap model){
		StudentImpl student=studentDAO.getStudent(id);		
		model.addAttribute("student", student);
	    return "displayStudent";
	}
	
	@RequestMapping(value = "/addNewStudent", method = RequestMethod.GET) 
	public String addNewStudent(ModelMap model) {    
		model.addAttribute("student", new StudentImpl());	
		return "addNewStudent";
	}


	@RequestMapping(value = "/addNewStudent", method = RequestMethod.POST)
	public String displayAddedStudent(@ModelAttribute("student") @Valid StudentImpl student,
			BindingResult result, ModelMap model) {
		
		if(result.hasErrors())
			return "addNewStudent"; 
				 int id;
		            try {   		            	
			        	id= studentDAO.createStudentGetID(student.getFirstName(), student.getLastName(), student.getStudentNumber(),
			        			student.getEmail(),student.getPhoneNumber(),student.getAddressLine1(),student.getAddressLine2());
			        	model.addAttribute("id", id);

		            } catch (Exception e) {
		            	model.addAttribute("message", "Creation of student failed, "+e.getLocalizedMessage());
						return "errorStudent"; 

		            }
		           model.addAttribute(student);		
		           return "displayStudent";

	}
	
	@RequestMapping(value="/modifyStudent", method = RequestMethod.GET)
	public String modify(ModelMap model) {
		List<StudentImpl> students=studentDAO.listStudents();
		model.addAttribute("students", students);
		return "modifyStudent";
	}
	
	@RequestMapping(value ="/modifyStudentForm/id/{id}/firstName/{firstName}"
			+ "/lastName/{lastName}/studentNumber/{studentNumber}/email/{email}"
			+ "/phoneNumber/{phoneNumber}/addressLine1/{addressLine1}/addressLine2/{addressLine2}", method = RequestMethod.GET)
	public String modifyStudentByID(@PathVariable int id,@PathVariable String firstName,
			@PathVariable String lastName,@PathVariable String studentNumber,@PathVariable String email,
			@PathVariable String phoneNumber,@PathVariable String addressLine1,@PathVariable String addressLine2, ModelMap model) {
		StudentImpl studentModify=studentDAO.getStudent(id);
		model.addAttribute("message", "Student with id "+ id +" can now be modified");
		model.addAttribute("student", studentModify);
		return "modifyStudentForm";
	}
	//http://localhost:8080/adfsprint2/student/modifyForm/id/37/firstName/Declan/lastName/Murphy
	///studentNumber/R00058443/email/Murphy/phoneNumber/0876727881/addressLine1/Tramore/addressLine2/Waterford
	@RequestMapping(value = "/removeStudent", method = RequestMethod.GET) 
	public String deleteStudent(ModelMap model) {
		List<StudentImpl> listStudents=studentDAO.listStudents();
		model.addAttribute("students", listStudents);		
		return "removeStudent";
	}
	
	@RequestMapping(value ="/removeStudent/id/{id}", method = RequestMethod.GET) 
	public String deleteStudentById(@PathVariable int id, ModelMap model) { 
		StudentImpl studentDelete=studentDAO.getStudent(id);
		studentDAO.deleteStudent(id);
		model.addAttribute("message", "Student " + studentDelete.getFirstName() + " " +
				studentDelete.getLastName() + " has been deleted from the system");
		model.addAttribute("firstName", studentDelete.getFirstName());
		model.addAttribute("lastName", studentDelete.getLastName());
		model.addAttribute("studentNumber", studentDelete.getStudentNumber());
		List<StudentImpl> listStudents=studentDAO.listStudents();
		model.addAttribute("students", listStudents);	
		return "removeStudent";
	}

}