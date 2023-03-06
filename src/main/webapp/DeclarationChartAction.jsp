<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.User_DAO" %>
<%@page import = "bbs.Bbs" %>
<%@page import = "bbs.BbsDAO" %>
<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>
<%@page import = "DeclarationChartAction.DeclarationChartDAO"%>
<%@page import = "DeclarationChartAction.DeclarationChart"%>
<%

String bbsID = null;
String Declaration = null;
String userID = null;


	if (session.getAttribute("userID") !=null){
 	userID = (String) session.getAttribute("userID");
 }

	if(request.getParameter("bbsID") != null){
	bbsID = (String) request.getParameter("bbsID");
	}
	if(request.getParameter("Declaration")  != null){
		Declaration = (String) request.getParameter("Declaration");
	}

	
	
	DeclarationChartDAO Chart = new DeclarationChartDAO();
	int result = Chart.Declaration(bbsID,Declaration,userID);
	BbsDAO bbs = new BbsDAO();
	
	if (result == -1){
		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert(' 해당 게시물을 이미 신고하였습니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
	}else{
		int result1 = bbs.updateAva(bbsID);
		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('신고가 성공적으로 접수 되었습니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
	}
%>
