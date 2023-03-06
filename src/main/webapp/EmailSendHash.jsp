<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="user.User_DAO" %>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@page import="java.io.PrintWriter" %>
<%@ page import="util.Gmail"%>
<%@ page import="java.util.Properties"%>
<%@ page import = "util.SHA256" %>
<%
User_DAO userDAO = new User_DAO();


String userID = null;
if (application.getAttribute("userID") != null) {
	userID = (String) application.getAttribute("userID");
}
if (userID == null) {
	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
	script.println("location.href='login.jsp'");
	script.println("</script>");
	script.close();
}

boolean emailChecked = userDAO.getUserEmailChecked(userID);
if (emailChecked == true) {
	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('이미 인증 된 회원입니다.');");
	script.println("location.href='index.jsp'");
	script.println("</script>");
	script.close();

}

	
	
	String host = "http://localhost:8080/Git_Jsp/Graduation-work/";
	String from = "woojp1104@gmail.com";
	String to = userDAO.getUserEmail(userID);
	String subject = "회원가입을 위한 이메일 인증입니다.";
	String content = "가입 절차 이오니 다음 링크에 접속하여 이메일 인증을 진행하세요. " + "<a href='" + host + "Graduation/src/main/webapp/emailCheckAction.jsp?code="
			+ SHA256.getSHA256(to) + "'>이메일인증하기</a>";
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "587");
		p.put("mail.smtp.socketFactory.Class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		try{
		

		
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
			
			

		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생하였습니다.');");
			
			script.println("history.back()"); 	
			script.println("</script>");
			script.close();
		}
%>