/*<%@ page language="java" contentType="text/html; text/javascript ;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.USER_DTO" %>
<%@page import="user.User_DAO" %>
<%@page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
 String UserIdCheck = null;
 
 if(request.getParameter("UserIdCheck") != null){
	 UserIdCheck = (String) request.getParameter("UserIdCheck");
    }
 User_DAO User_DAO = new User_DAO();
 int result = User_DAO.IDCheck(UserIdCheck);
 if (result == 1 ){
	
     PrintWriter script = response.getWriter();
     script.println("<script>");
     script.println("alert(' 아이디 중복이 없습니다.');");
     script.println("location.href='login.jsp'");
   
     script.println("</script>");
     script.close();
     return;
  }else if (result == 0){
     PrintWriter script = response.getWriter();
     script.println("<script>");
     script.println("alert(' 아이디가 중복되었습니다.');");
     script.println("history.back()");
     script.println("</script>");
     script.close();
     return;
  }
 
%>*/