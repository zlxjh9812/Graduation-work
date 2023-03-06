<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
<%
User_DAO userDAO = new User_DAO();

String BoardContent = null;
String userID = null;
String BoardID = null;

if (request.getParameter("BoardContent") != null) {
	BoardContent = request.getParameter("BoardContent");
}
if (request.getParameter("userID") != null) {
	userID = request.getParameter("userID");
}
if (request.getParameter("BoardID") != null) {
	BoardID = request.getParameter("BoardID");
}
if(userID == null){
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생하였습니다.');");
	
	script.println("history.back()"); 	
	script.println("</script>");
	script.close();
}


String host = "http://localhost:8080/JSP/";
String from = "woojp1104@gmail.com";
String to = userDAO.getUserEmail(userID);
String subject = "댓글 삭제 관련 이메일 입니다.";
String content = "회원님의 댓글 " +BoardContent+ " 이 신고로 인하여 삭제되었습니다.";
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		
		String bbsID = null;
	if(request.getParameter("bbsID") != null){
		bbsID = request.getParameter("bbsID");
	}
		
				
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.boardDelete(BoardID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 삭제에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
			
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 삭제 완료')");
					script.println("location.href='BoardManage.jsp'");
					script.println("</script>");
				}
			
		
	
	%>
</body>
</html>
 