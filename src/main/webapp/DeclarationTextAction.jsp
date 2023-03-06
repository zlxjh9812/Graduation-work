<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.User_DAO" %>
<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>
<%@page import = "declarationcharttext.declarationcharttextDAO"%>
<%@page import = "declarationcharttext.declarationcharttext"%>
<%

String boardID = null;
String Declaration = null;
String userID = null;
if (session.getAttribute("userID") !=null){
	userID = (String) session.getAttribute("userID");}
if(request.getParameter("boardID") != null){
	boardID = (String) request.getParameter("boardID");
	}
	if(request.getParameter("Declaration")  != null){
		Declaration = (String) request.getParameter("Declaration");
	}

	BoardDAO BoardDAO = new BoardDAO();
	
	declarationcharttextDAO Text = new declarationcharttextDAO();
	int result = Text.DeclarationText(boardID,Declaration,userID);
	if (result == -1){
		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert(' 해당 게시물을 이미 신고하였습니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
	}else{
		int ava = BoardDAO.updateAva(boardID);
		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('신고가 성공적으로 접수 되었습니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
	}
%>
