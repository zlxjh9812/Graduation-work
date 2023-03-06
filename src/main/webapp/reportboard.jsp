<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String BoardID = null;
if (request.getParameter("BoardID") != null) {
	BoardID = request.getParameter("BoardID");
}



BoardDAO boardDAO = new BoardDAO();
int result = boardDAO.reportAva(BoardID);
int result1 =  boardDAO.deleteReportBoard(BoardID);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 철회에 실패하였습니다')");
		script.println("history.back()");
		script.println("</script>");

	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 철회에 성공하였습니다')");
		script.println("location.href='BoardManage.jsp'");
		script.println("</script>");
	}



%>