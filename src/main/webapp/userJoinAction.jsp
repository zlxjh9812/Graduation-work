<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.USER_DTO" %>
<%@page import="user.User_DAO" %>
<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>


<%
    request.setCharacterEncoding("UTF-8");
    String userID = null;
    String userPassWord =null;
	String userPassWord2 =null;
	String firstName = null;
	String Name = null;
	String userEmail = null;
	String userPic = null;
	String Usercalendar = null;
	if (request.getParameter("userID") != null) {
		userID = request.getParameter("userID");
	}
	
	
	if (request.getParameter("userPassWord") != null) {
		userPassWord = request.getParameter("userPassWord");
	}
	if (request.getParameter("userPassWord2") != null) {
		userPassWord2 = request.getParameter("userPassWord2");
	}
      
	
	if (request.getParameter("firstName") != null) {
		firstName = request.getParameter("firstName");
	}
	if (request.getParameter("Name") != null) {
		Name = request.getParameter("Name");
	}
	if (request.getParameter("userEmail") != null) {
		userEmail = request.getParameter("userEmail");
	}
	
      
       if(userID == "" || userPassWord == "" ||  firstName == "" || Name == ""||userEmail==""){
           PrintWriter script = response.getWriter();
           script.println("<script>");
           script.println("alert(' 입력이 안된 사항이 있습니다.');");
           script.println("history.back()");
           script.println("</script>");
           script.close();
           return;
       }	
		
       User_DAO User_DAO = new User_DAO();
       int result = User_DAO.join(userID,SHA256.getSHA256(userPassWord),SHA256.getSHA256(userPassWord2),firstName,Name,userEmail,SHA256.getSHA256(userEmail),false,userPic,Usercalendar);
 		if (result == -1) {
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("alert('이미 존재하는 아이디 입니다.');");
 			  script.println("history.back()"); 	
 				
 			script.println("</script>");
 			script.close();
 			//return;

 		} else if(result ==1){

 			
 			
 			application.setAttribute("userID", userID);
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("location.href = 'emailSendAction.jsp'");
 			script.println("</script>");
 			script.close();
 			//return;
 			

 		
 		}else{
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("alert('비밀번호가 서로 다릅니다 다시 시도해주세요');");
 			  script.println("history.back()"); 	
 				
 			script.println("</script>");
 			script.close();
 		}
 		

%>