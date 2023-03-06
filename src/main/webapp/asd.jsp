<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<%@page import = "user.User_DAO" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="util.Gmail"%>
<%@ page import="java.util.Properties"%>
<%@ page import = "util.SHA256" %>
    <%
 
		String days = null;
	
		
		
		
    if(request.getParameter("days") != null){
    	days = request.getParameter("days");
	}
		
		
    if(days != null){
    	PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println(days);
   		
   		script.println("</script>");
   		script.close();
   		return;
    }
			
    
    
    %>
