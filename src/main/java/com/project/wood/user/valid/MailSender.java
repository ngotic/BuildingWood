package com.project.wood.user.valid;

import java.io.File;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender{
	
	public static int sender(String mailkey, String email) {

        final String username = "buildingwoodhelper@gmail.com";
        final String password = mailkey;
        System.out.println(mailkey);
        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("buildingwoodhelper@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email+", buildingwoodhelper@gmail.com")
            ); // 빌딩우드 관리자에게 참조 달아서 메일보냄
            
            Random r = new Random();
    		int authnum = r.nextInt(999999)+111111; 
    		
            message.setSubject("빌딩우드 이메일 인증메일입니다.");
            message.setText("Buildingwood 관리자,"
                    + "안녕하세요. Buildingwood 인증번호는 "+authnum+ "입니다.");

            Transport.send(message);
            
            return authnum;

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return 0;
    }
}