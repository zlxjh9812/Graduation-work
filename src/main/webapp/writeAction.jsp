<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	 	int bbsID;
		String bbsTitle = null;
	 	String userID = null;
	 	String bbsDate = null;
	 	String bbsContent = null;
		int bbsAvailable;
		String fileName = null;
	
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding ="UTF-8";
		
		MultipartRequest multipartRequest 
		= new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		
		
		fileName = (String)multipartRequest.getFilesystemName("fileName");
		bbsTitle =multipartRequest.getParameter("bbsTitle");
   		bbsContent = multipartRequest.getParameter("bbsContent");
		
		
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		if(bbsContent.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글의 내용을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
			if(bbsTitle == "" || bbsContent.equals(null)){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbsTitle, userID, bbsContent,fileName);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
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