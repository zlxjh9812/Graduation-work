<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="friends.Friends"%>
<%@page import="friends.FriendsDAO" %>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<%
		String myID = null;
		String rqID = null;
		
		
		if(session.getAttribute("userID") != null){
			myID = (String)session.getAttribute("userID");
		}
		
		if (request.getParameter("myfrID") != null) {
			rqID = request.getParameter("myfrID");
		}
		
		
		
		FriendsDAO friendsDAO = new FriendsDAO();	
		int result = friendsDAO.deleteFriends(rqID,myID);
		if(result == -1){// 데이터베이스 오류인 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('친구거절완료!')");
			script.println("location.href='requestfriends.jsp'");
			script.println("</script>");
		
		}
		
		
	%>

</body>
</html>