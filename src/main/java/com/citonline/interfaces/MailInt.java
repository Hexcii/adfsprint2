/**
 * @author Fabien
 *
 * @since 26 déc. 2014
 */
package com.citonline.interfaces;

import org.springframework.stereotype.Service;

/**
 * @author Fabien
 *
 */
@Service
public interface MailInt {
	
	/**
	 * Send a mail with the chosen params.
	 * 
	 * @param to the destination of the email
	 * @param from the sender of the email
	 * @param subject the subject of the email
	 * @param message the actual message of the email
	 */
	public void sendMail(String to, String from, String subject, String message);
	
	/**
	 * Send a standard mail.
	 */
	public void sendPreconfiguredMail();
}
