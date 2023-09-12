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
        
        
        String mail_id = "alphagoTemp@gmail.com";
        String mail_pw = "lhmaboostpxberxj";
        
        Authenticator auth = new MailAuth(mail_id, mail_pw);
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        System.out.println("===== step1 =====");
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("alphagoTemp@gmail.com", "alphago"));
            InternetAddress to = new InternetAddress(userEmail);         
            msg.setRecipient(Message.RecipientType.TO, to);            

	         // 메일 제목
			msg.setSubject(userName + " 님 임시 비밀번호를 알려드립니다.", "UTF-8");
			// 메일 내용
			msg.setText(userName + " 님의 임시 비밀번호는 " + temporaryPassword + " 입니다.", "UTF-8");           
            
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

	
	
	public void emailCheckSendMail(String userEmail, String temporaryPassword) {
		Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        
        String mail_id = "alphagoTemp@gmail.com";
        String mail_pw = "lhmaboostpxberxj";
        
        Authenticator auth = new MailAuth(mail_id, mail_pw);
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        System.out.println("===== step1 =====");
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("alphagoTemp@gmail.com", "alphago"));
            InternetAddress to = new InternetAddress(userEmail);         
            msg.setRecipient(Message.RecipientType.TO, to);            

	         // 메일 제목
			msg.setSubject("회원가입 인증 코드를 알려드립니다.", "UTF-8");
			// 메일 내용
			msg.setText("회원가입 인증 코드는 " + temporaryPassword + " 입니다.", "UTF-8");           
            
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
    
    public MailAuth(String mail_id, String mail_pw) {
		// 사용자 인증 정보를 담아서 반환
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}