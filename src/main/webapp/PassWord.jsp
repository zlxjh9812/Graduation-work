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

	

	if (application.getAttribute("userID") != null) {
		userID = (String) application.getAttribute("userID");
	}
	if (request.getParameter("userPassWord") != null) {
		userPassWord = request.getParameter("userPassWord");
	}
	if (request.getParameter("userPassWord2") != null) {
		userPassWord2 = request.getParameter("userPassWord2");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("history.back()"); 	
		script.println("</script>");
		script.close();
	}

      
	
	
	
      
       if( userPassWord == "" ||  userPassWord2 == ""){
           PrintWriter script = response.getWriter();
           script.println("<script>");
           script.println("alert(' 입력이 안된 사항이 있습니다.');");
           script.println("history.back()");
           script.println("</script>");
           script.close();
           return;
       }	
		
       User_DAO User_DAO = new User_DAO();
       int result = User_DAO.ResetPassWord(SHA256.getSHA256(userPassWord),SHA256.getSHA256(userPassWord2),userID);
 		if (result == -1) {
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("alert('오류가 발생하였습니다.');");
 			  script.println("history.back()"); 	
 				
 			script.println("</script>");
 			script.close();
 			//return;

 		} else if(result == 0){

 			
 			
 			application.setAttribute("userID", userID);
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("alert('비밀번호가 서로 다릅니다.');");
 			script.println("history.back()"); 	
 			script.println("</script>");
 			script.close();
 			//return;
 			

 		
 		}else{
 			application.setAttribute("userID", userID);
 			PrintWriter script = response.getWriter();

 			script.println("<script>");
 			script.println("alert('비밀번호가 재 설정 되었습니다.');");
 			script.println("location.href = 'login.jsp'");
 			script.println("</script>");
 			script.close();
 			//return;
 			
 		}

%>