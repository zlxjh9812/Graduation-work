<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.USER_DTO" %>
<%@page import="user.User_DAO" %>
<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>
<%@page import = "bbs.Bbs" %>
<%@page import = "bbs.BbsDAO" %>
<%@page import = "util.SHA256" %>

<%@page import = "DeclarationChartAction.DeclarationChartDAO"%>
<%@page import = "DeclarationChartAction.DeclarationChart"%>
<%


String claendar = null;
String userID = null;


	if (session.getAttribute("userID") !=null){
 	userID = (String) session.getAttribute("userID");
 }

	if(request.getParameter("claendar") != null){
		claendar = (String) request.getParameter("claendar");
	}
	

	
	
	User_DAO User_DAO = new User_DAO();
	int result = User_DAO.updateUserCalendar(claendar,userID);
	// 데이터베이스 오류인 경우
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경에 실패하였습니다')");
		script.println("history.back()");
		script.println("</script>");
	// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경에 성공하였습니다.')");
		script.println("location.href='layout-static.jsp'");
		script.println("</script>");
	}
	

%>
