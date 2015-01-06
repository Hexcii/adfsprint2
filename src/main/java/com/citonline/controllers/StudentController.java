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
	
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modify(ModelMap model) {
		List<StudentImpl> students=studentDAO.listStudents();
		model.addAttribute("students", students);
		return "modifyStudent";
	}
	
	@RequestMapping(value ="/modify/id/{id}", method = RequestMethod.GET)
	public String modifyStudentByID(@PathVariable int id, ModelMap model) {
		StudentImpl studentModify=studentDAO.getStudent(id);
		model.addAttribute("message", "Student with id "+ id +" can now be modified");
		model.addAttribute("student", studentModify);
		return "modifyStudentForm";
	}
	
	/*
	
	@RequestMapping(value ="/modify/firstName/{firstName}/lastName/{lastName}", method = RequestMethod.GET)
	public String modifyStudentByFirstNameLastName(@PathVariable String firstName, @PathVariable String lastName,
			ModelMap model) {
		StudentImpl studentModify=studentDAO.getStudent(firstName, lastName);
		model.addAttribute("message", "Student with name "+ firstName + " " + lastName +" can now be modified");
		model.addAttribute("student", studentModify);
		return "modifyStudentForm";
	}
	
	@RequestMapping(value="/modify/id/{id}/idManagedProgram/{idManagedProgram}", method = RequestMethod.GET)
	public String modifyStudentIdManagedProgram(@PathVariable int id, @PathVariable int idManagedProgram,
			ModelMap model) {
		studentDAO.updateStudentManagedProgram(id, idManagedProgram);
		StudentImpl studentModify=studentDAO.getStudent(id);
		model.addAttribute("message", "Student with id "+ id +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("idManagedProgram", studentModify.getIdManagedProgram());
		return "displayStudent";
	}
	
	@RequestMapping(value ="/modify/firstName/{firstName}/lastName/{lastName}/idManagedProgram/{idManagedProgram}",
			method = RequestMethod.GET)
	public String modifyStudentIdManagedProgram(@PathVariable String firstName, @PathVariable String lastName,
			@PathVariable int idManagedProgram, ModelMap model) {
		studentDAO.updateStudentManagedProgram(firstName, lastName, idManagedProgram);
		StudentImpl studentModify=studentDAO.getStudent(firstName, lastName);
		model.addAttribute("message", "Student with name "+ firstName + " " + lastName +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("idManagedProgram", studentModify.getIdManagedProgram());
		return "displayStudent";
	}
	
	@RequestMapping(value="/modify/id/{id}/phoneNumber/{phoneNumber}", method = RequestMethod.GET)
	public String modifyStudentPhoneNumber(@PathVariable int id, @PathVariable String phoneNumber, ModelMap model) {
		studentDAO.updateStudentPhoneNumber(id, phoneNumber);
		StudentImpl studentModify=studentDAO.getStudent(id);
		model.addAttribute("message", "Student with id "+ id +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("phoneNumber", studentModify.getPhoneNumber());
		return "displayStudent";
	}
	
	@RequestMapping(value="/modify/firstName/{firstName}/lastName/{lastName}/phoneNumber/{phoneNumber}", method = RequestMethod.GET)
	public String modifyStudentPhoneNumber(@PathVariable String firstName, @PathVariable String lastName,
			@PathVariable String phoneNumber, ModelMap model) {
		studentDAO.updateStudentPhoneNumber(firstName, lastName, phoneNumber);
		StudentImpl studentModify=studentDAO.getStudent(firstName, lastName);
		model.addAttribute("message", "Student with name "+ firstName + " " + lastName +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("phoneNumber", studentModify.getPhoneNumber());
		return "displayStudent";
	}
	
	@RequestMapping(value="/modify/id/{id}/roomNumber/{roomNumber}", method = RequestMethod.GET)
	public String modifyStudentRoomNumber(@PathVariable int id, @PathVariable String roomNumber, ModelMap model) {
		studentDAO.updateStudentRoomNumber(id, roomNumber);
		StudentImpl studentModify=studentDAO.getStudent(id);
		model.addAttribute("message", "Student with id "+ id +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("roomNumber", studentModify.getRoomNumber());
		return "displayStudent";
	}
	
	@RequestMapping(value="/modify/firstName/{firstName}/lastName/{lastName}/roomNumber/{roomNumber}", method = RequestMethod.GET)
	public String modifyStudentRoomNumber(@PathVariable String firstName, @PathVariable String lastName,
			@PathVariable String roomNumber, ModelMap model) {
		studentDAO.updateStudentRoomNumber(firstName, lastName, roomNumber);
		StudentImpl studentModify=studentDAO.getStudent(firstName, lastName);
		model.addAttribute("message", "Student with name "+ firstName + " " + lastName +" has been modified");
		model.addAttribute("firstName", studentModify.getFirstName());
		model.addAttribute("lastName", studentModify.getLastName());
		model.addAttribute("phoneNumber", studentModify.getRoomNumber());
		return "displayStudent";
	}	
	*/
	
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