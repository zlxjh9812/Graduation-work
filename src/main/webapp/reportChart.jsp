<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String bbsID = null;
if (request.getParameter("bbsID") != null) {
	bbsID = request.getParameter("bbsID");
}



BbsDAO BbsDAO = new BbsDAO();
int result = BbsDAO.reportChart(bbsID);
int result1 = BbsDAO.deleteReportChart(bbsID);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 철회에 실패하였습니다')");
		script.println("history.back()");
		script.println("</script>");

	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물 철회에 성공하였습니다')");
		script.println("location.href='ChartManage.jsp'");
		script.println("</script>");
	}



%>