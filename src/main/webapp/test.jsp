<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<%@page import = "user.User_DAO" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="util.Gmail"%>
<%@ page import="java.util.Properties"%>
<%@ page import = "util.SHA256" %>
    <%
    String test = null;
    if(request.getParameter("test") != null){
    	test = (String) request.getParameter("test");
    	}
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=session.getAttribute("test") %>
</body>
</html>