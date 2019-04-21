package com.iflytek.util;

import java.util.Properties;

/*import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;*/





public class UtilMail {
    
/*	public static void main(String[] args) throws AddressException, MessagingException {
		  getMail("2014645539@qq.com",getRandom());
	}
	
	public static void getMail(String mail,String text) throws AddressException, MessagingException {
		Properties props=new Properties();
        props.setProperty("mail.host", "smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");
        Authenticator auth=new Authenticator() {
        	public PasswordAuthentication getPasswordAuthentication(){
        		return new PasswordAuthentication("15755184185", "2289927278wyf");
        	}
		};
		Session session=Session.getInstance(props, auth);
		
		MimeMessage  msg=new MimeMessage(session);
		msg.setFrom(new InternetAddress("15755184185@163.com"));
		msg.addRecipient(RecipientType.TO, new InternetAddress(mail));
		
		msg.setSubject("来自在线下单系统的验证码");
		msg.setContent(text,"text/html;charset=utf-8");
		Transport.send(msg);
	}
	  public static String getRandom(){
	    	String[] str={"0","1","2","3","4","5","6","7","8","9"};
	    	String code="";
	    	 for(int i=0;i<=3;i++){
	    		 code+=str[(int) Math.floor(Math.random()*10)];
	    	 }
	    	  return code;
	    }
*/
}
