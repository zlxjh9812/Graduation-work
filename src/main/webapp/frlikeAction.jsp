<%@page import="java.io.PrintWriter"%>
<%@page import="like.LikeDAO"%>
<%@page import="like.Like" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		
	 	String userID = null;
		String bbsID = null;
		String frID = null;
		
		
		
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(request.getParameter("bbsID") != null){
			bbsID = request.getParameter("bbsID");
		}
		
		if(request.getParameter("frID") != null){
			frID = request.getParameter("frID");
		}
		
		
			
			

				LikeDAO likeDAO = new LikeDAO();
				int result = likeDAO.AddLike(bbsID,userID);
				// 데이터베이스 오류인 경우
				if(result == -1){
					application.setAttribute("frID",frID);
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='frlikedeleteAction.jsp?bbsID="+bbsID+"'");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='friendcontent.jsp?friendsID="+frID+"'");
					script.println("</script>");
				}
			
		
				
	%>
</body>
</html>