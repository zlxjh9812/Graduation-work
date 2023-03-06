<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.User_DAO" %>

<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
String userID = null;
String userEmail = null;	

if(request.getParameter("userID") != null){
	userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userEmail")  != null){
		userEmail = (String) request.getParameter("userEmail");
	}
	
	if(userID == "" || userEmail == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(' 입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	

   	

 	User_DAO UserDAO = new User_DAO();
   	int result1 = UserDAO.ResetPWID(userID);
 	int result2 = UserDAO.ResetPWEmail(userEmail);
   	if (result1 == 1 && result2 == 1){
   		
   		application.setAttribute("userID",userID);
   		application.setAttribute("userEmail", userEmail);
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("location.href='emailPassword.jsp'");
   		script.println("</script>");
   		script.close();
   		return;
   		}else if(result1 ==1 && result2 == -1){
   			PrintWriter script = response.getWriter();
   	   		script.println("<script>");
   	   	
   	   		script.println("alert('올바르지 않은 이메일입니다.');");
   	   	script.println("history.back();");
   	   				
   	   		script.println("</script>");
   	   		script.close();
   	   		return;
   		}else if(result1 ==-1 && result2 == 1){
   			PrintWriter script = response.getWriter();
   	   		script.println("<script>");
   	   	
   	   		script.println("alert('올바르지 않은 아이디 입니다.');");
   	   	script.println("history.back();");
   	   				
   	   		script.println("</script>");
   	   		script.close();
   	   		return;
   	   		}else{
   	   		PrintWriter script = response.getWriter();
   	   		script.println("<script>");
   	   	
   	   		script.println("alert('올바르지 않은 접근 입니다.');");
   	   	script.println("history.back();");
   	   				
   	   		script.println("</script>");
   	   		script.close();
   	   		return;
   	   		}
   		
    
  
    
 
   
   

%>