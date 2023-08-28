package com.alpha.service;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;


	

@Component
public class MailService {

	public void findPwSendMail(String userId, String userEmail, String userName, String temporaryPassword) {
		Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        System.out.println("===== step1 =====");
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("alphagoTemp@gmail.com", "alphago"));
            InternetAddress to = new InternetAddress("userEmail");         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("제목", "UTF-8");            
            msg.setText("안녕하세요 테스트 메일입니다.", "UTF-8");            
            
            Transport.send(msg);
            
            System.out.println("===== step2 =====");

            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());
        }
                
    }

	
	
}



class MailAuth extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "alphagoTemp";
        String mail_pw = "lhmaboostpxberxj";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}