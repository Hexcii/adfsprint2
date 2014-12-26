/**
 * @author Fabien
 *
 * @since 26 déc. 2014
 */
package com.citonline.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.citonline.domain.EmailForm;
import com.citonline.interfaces.MailInt;

/**
 * @author Fabien
 *
 */
public class EmailController {
	
	@Autowired
	private MailInt mail;	
     
	@RequestMapping(value = "/sendEmail", method = RequestMethod.GET) 
	public ModelAndView sendEmail() {                                
		System.out.println("Send an email.");
		ModelMap map=new ModelMap();
		map.addAttribute("email", new EmailForm());
		return new ModelAndView("sendEmail", map);
	} 
	
	@RequestMapping(value = "/sendEmail", method = RequestMethod.POST) 
	public String sendEmailRequest(@ModelAttribute("email") @Valid EmailForm email, BindingResult result, ModelMap model) {	

		if(result.hasErrors())		
			return "sendemail";			

		model.addAttribute("to", email.getTo());
		model.addAttribute("from", email.getFrom());	
		model.addAttribute("subject", email.getSubject());
		model.addAttribute("message", email.getMessage());
		
		mail.sendMail( email.getFrom(), email.getTo(), email.getSubject(), email.getMessage());
		mail.sendPreconfiguredMail();		
				
		return "displayEmail";
	}
}
