<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	 	String bbsID = null;
		String bbsTitle = null;
	 	String userID = null;
	 	String bbsDate = null;
	 	String bbsContent = null;
	 	String fileName = null;
		int bbsAvailable;
	
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding ="UTF-8";
	
		MultipartRequest multipartRequest 
		= new MultipartRequest(request, directory, maxSize, encoding,
			new DefaultFileRenamePolicy());
		
		
		fileName = (String)multipartRequest.getFilesystemName("fileName");
		bbsTitle =multipartRequest.getParameter("bbsTitle");
   		bbsContent = multipartRequest.getParameter("bbsContent");
   		bbsID = multipartRequest.getParameter("bbsID");
		
		
			
			
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbsTitle,bbsContent,fileName,bbsID);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='charts.jsp'");
					script.println("</script>");
				}
			
		
	
	%>
</body>
</html>
 