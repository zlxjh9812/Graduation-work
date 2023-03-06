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
String userEmail = null;
if (application.getAttribute("userID") != null) {
	userID = (String) application.getAttribute("userID");
}
if (application.getAttribute("userEmail") != null) {
	userEmail = (String) application.getAttribute("userEmail");
	
}
if (userID == ""||userEmail == "" ) {
	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('값을 읍력해주세요');");
	script.println("history.back()"); 	
	script.println("</script>");
	script.close();

}



{

	
	
	String host = "http://localhost:8080/JSP/";
	String from = "woojp1104@gmail.com";
	String to = userDAO.getUserEmail(userID);
	String subject = "비밀번호 재 설정을 위한 절차입니다";
	String content = "비밀번호 재 설정 절차이오니 다음 링크에 접속하여 진행해주세요 " + "<a href='" + host + "/emailPasswordAction.jsp?code="
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
}
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이메일 인증</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body>

    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">이메일 인증</h3></div>
                                    <div class="card-body">
                                        	<section class="container mt-3" style="max-width: 560px;">
													<div class="arert mt-4" role="alert">
																	비밀번호 재설정 메일을 보냈습니다. <br> 메일을 확인해주세요
																	
														
																</div>
																<br>
																<input class="btn btn-primary" onClick = "location.href = 'login.jsp'" type="submit" value="로그인 하러가기">
															</section>
														                                   
														 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
           
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src = "js/Login.js"></script>
    </body>
</html>


