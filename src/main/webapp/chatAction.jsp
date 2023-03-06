<%@page import="java.io.PrintWriter"%>
<%@page import="chat.ChatDAO"%>
<%@page import="chat.ChatDTO" %>
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
		
	 	int chatID;
		String fromID = null;
		String toID = null;
		String chatContent = null;
		
		
		
		
		if(session.getAttribute("userID") != null){
			fromID = (String)session.getAttribute("userID");
		}
		
		if(request.getParameter("toID") != null){
			toID = request.getParameter("toID");
		}
		
		if(request.getParameter("chatContent") != null){
			chatContent = request.getParameter("chatContent");
		}
		
		
		
			

				ChatDAO chatDAO = new ChatDAO();
				int result = chatDAO.write(fromID,toID,chatContent);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('메시지 보내기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='privateChat.jsp?toID="+toID+"'");
					script.println("</script>");
				}
			
		
				
	%>
</body>
</html>