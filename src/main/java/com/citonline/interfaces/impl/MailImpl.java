/**
 * @author Fabien
 *
 * @since 26 déc. 2014
 */
package com.citonline.interfaces.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.citonline.interfaces.MailInt;

/**
 * @author Fabien
 *
 */
@Component
public class MailImpl implements MailInt {
	
	@Autowired
	private JavaMailSender mailSender;	
	@Autowired
	private SimpleMailMessage customMailMessage;

	/* (non-Javadoc)
	 * @see com.citonline.interfaces.MailInt#sendMail(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public void sendMail(String to, String from, String subject, String message) {
		SimpleMailMessage smMsg = new SimpleMailMessage(); 
		smMsg.setFrom(from);
		smMsg.setTo(to);
		smMsg.setSubject(subject);
		smMsg.setText(message);
		mailSender.send(smMsg);
	}

	/* (non-Javadoc)
	 * @see com.citonline.interfaces.MailInt#sendPreconfiguredMail()
	 */
	@Override
	public void sendPreconfiguredMail() {
		mailSender.send(customMailMessage);
	}
}
