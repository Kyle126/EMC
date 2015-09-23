package com.mercury.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class JavaMailService {
	private JavaMailSender mailSender;
	//private SimpleMailMessage simpleMailMessage;
	
	public JavaMailSender getMailSender() {
		return mailSender;
	}
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	  public void sendMail(final String from, final String to, final String subject, final String msg){
		MimeMessage message = mailSender.createMimeMessage();
		try{
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(msg);
			//mailSender.send(message);
		} catch (MessagingException e) {
			throw new MailParseException(e);
			//e.printStackTrace();
		}
		mailSender.send(message);
	}
}
