package com.citonline.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.citonline.db.interfaces.StudentDAO;
import com.citonline.interfaces.impl.StudentImpl;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentDAO studentDAO;
	
	@RequestMapping(value={"/listall", "/listAll"}, method = RequestMethod.GET)
	public String listAll(ModelMap model) {
			
			List<StudentImpl> listStudents = studentDAO.listStudents();
			model.addAttribute("students", listStudents);
		    return "displayStudents";
		}
	
	@RequestMapping(value="/list/{studentNumber}", method=RequestMethod.GET)
	 public String getStudentByStudentNumber(@PathVariable String studentNumber,
			 ModelMap model){
		StudentImpl student=studentDAO.getStudent(studentNumber);
		List<StudentImpl> listStudents = new ArrayList<StudentImpl>();
		listStudents.add(student);
		
		model.addAttribute("students", listStudents);
	    return "displayStudents";
	}
	
	@RequestMapping(value = "/addNew", method = RequestMethod.GET) 
	public String addNewStudent(ModelMap model) {    
		model.addAttribute("student", new StudentImpl());	
		return "newStudent";
	} 

	/*
	@RequestMapping(value = "/addNew", method = RequestMethod.POST)
	public String displayStudent(@ModelAttribute("student") @Valid StudentImpl student,
			@RequestParam("file") MultipartFile file,
			BindingResult result, ModelMap model) {
		
		if(result.hasErrors())
			return "newStudent"; 
		
		try {
			 if (!file.isEmpty()) {
				 
				 validateImage(file);
				 
		            try {     
		            	model.addAttribute("firstName", student.getFirstName());
			        	model.addAttribute("lastName", student.getLastName());
			        	model.addAttribute("email", student.getEmail());
			        	model.addAttribute("phoneNumber", student.getPhoneNumber());
			        	model.addAttribute("roomNumber", student.getRoomNumber());
			        	model.addAttribute("idManagedProgram", student.getIdManagedProgram());
			        	int id= studentDAO.createStudentGetID(student.getFirstName(), student.getLastName(), student.getEmail(),
			        			student.getPhoneNumber(), student.getRoomNumber(), student.getIdManagedProgram());
			        	model.addAttribute("id", Integer.toString(id));
		            	
		                byte[] bytes = file.getBytes(); 
		                File dir = new File(servletContext.getRealPath("/")+"/resources/images");
		                System.out.println(dir.getAbsolutePath());
		                
		                if (!dir.exists())
		                    dir.mkdirs();		                
		               		 
		                // Create the file on server
		                String fileLocation=dir.getAbsolutePath()
		                        + File.separator + Integer.toString(id)+".jpg";;
		                
		                File serverFile = new File(fileLocation);
		                
		                BufferedOutputStream stream = new BufferedOutputStream(
		                        new FileOutputStream(serverFile));
		                
		                stream.write(bytes);
		                stream.close();		  
		    			
		            } catch (Exception e) {
		            	model.addAttribute("message", "Creation of student failed, "+e.getLocalizedMessage());
						return "displayError"; 

		            }
			 }else{
				 model.addAttribute("message", "You failed to upload " + file.getOriginalFilename() + " because the file was empty.");
				 return "displayError"; 
			 }
			} catch(ImageUploadException e){
				 model.addAttribute("message", "Creation of student failed. The system only supports JPEGs.");
				 return "displayError"; 
			
			}		
		
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
	
	@RequestMapping(value ="/delete/id/{id}", method = RequestMethod.GET) 
	public String deleteSongwriterbyId(@PathVariable int id, ModelMap model) { 
		StudentImpl studentDelete=studentDAO.getStudent(id);
		studentDAO.deleteStudent(id);
		model.addAttribute("message", "Student with id "+ id +" and details below have been deleted from the system");
		model.addAttribute("firstName", studentDelete.getFirstName());
		model.addAttribute("lastName", studentDelete.getLastName());
		return "displayStudent";
	}
	
	*/
}