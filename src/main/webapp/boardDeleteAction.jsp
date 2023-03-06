<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
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
		
	 	String boardID = null;	
		String bbsID = null;
		
		
		
		if(request.getParameter("boardID") != null){
			boardID = request.getParameter("boardID");
		}
	
		if(request.getParameter("bbsID") != null){
			bbsID = request.getParameter("bbsID");
		}	
			

				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.boardDelete(boardID);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글삭제 실패')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글삭제 성공')");
					script.println("location.href='board.jsp?bbsID="+bbsID+"'");
					script.println("</script>");
				}
			
		
				
	%>
</body>
</html>