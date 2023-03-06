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
		
	 	int boardID;
		String boardUserID = null;
		String boardContent = null;
		String writeDate = null;
		String bbsID = null;
		
		
		
		if(session.getAttribute("userID") != null){
			boardUserID = (String)session.getAttribute("userID");
		}
		
		if(request.getParameter("boardContent") != null){
			boardContent = request.getParameter("boardContent");
		}
		
		if(request.getParameter("bbsID") != null){
			bbsID = request.getParameter("bbsID");
		}
		
		
			if(boardContent == "" ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글을 입력해주세요!')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			

				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.boardWrite(boardUserID,boardContent,bbsID);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글달기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글쓰기 성공')");
					script.println("location.href='board.jsp?bbsID="+bbsID+"'");
					script.println("</script>");
				}
			
		
				
	%>
</body>
</html>