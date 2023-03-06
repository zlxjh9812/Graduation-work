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
	
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding ="UTF-8";
	
		MultipartRequest multipartRequest 
		= new MultipartRequest(request, directory, maxSize, encoding,
			new DefaultFileRenamePolicy());
		
		bbsID =multipartRequest.getParameter("bbsID");
		    
				
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.delete(bbsID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
			
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제 완료')");
					script.println("location.href='charts.jsp'");
					script.println("</script>");
				}
			
		
	
	%>
</body>
</html>
 