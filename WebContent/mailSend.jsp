<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
  
	String name = request.getParameter("name");
	String from = request.getParameter("from");
	String[] to = request.getParameterValues("to");
	String subject = request.getParameter("title");
	String content = request.getParameter("content");
  
	Properties p = new Properties(); // 정보를 담을 객체
  
	p.put("mail.smtp.host","smtp.naver.com"); // smtp 네이버
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
 
  
	try{
    	Authenticator auth = new SMTPAuthenticator();
    	Session ses = Session.getInstance(p, auth);
      
    	ses.setDebug(true);
    	MimeMessage msg = new MimeMessage(ses); // 메일의 내용
 
    	msg.setSubject(subject); // 제목
 
    	StringBuffer buffer = new StringBuffer();
    	buffer.append(content+"<br>");
    	Address fromAddr = new InternetAddress(from);
    	msg.setFrom(fromAddr); 
 
    	Address[] toAddr = new Address[to.length];
    	
    	for(int i = 0; i < to.length; i++) {
    		
    		toAddr[i] = new InternetAddress(to[i]);
    	}
    	
    	// msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
    	
    	msg.addRecipients(Message.RecipientType.TO, toAddr);
     
    	msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
    	Transport.send(msg); // 전송  
 
	} catch(Exception e){
    	e.printStackTrace();
   	 	return;
	}	
%>
<html>
<head>
</head>
<body>

메일전송에 성공하였습니다.

</body>
</html>