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
		String frID = null;
		String frID1 = null;
		String myID = null;
		String myID1 = null;
		
	
		if(session.getAttribute("userID") != null){
			myID = (String)session.getAttribute("userID");
		}
		if(session.getAttribute("userID") != null){
			myID1 = (String)session.getAttribute("userID");
		}
		
		if (request.getParameter("friendsID") != null) {
			frID = request.getParameter("friendsID");
		}
		if (request.getParameter("friendsID") != null) {
			frID1 = request.getParameter("friendsID");
		}
		
		
		
		FriendsDAO friendsDAO = new FriendsDAO();	
		int result = friendsDAO.dropFriends(frID,frID1,myID,myID1);
		if(result == -1){// 데이터베이스 오류인 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('친구삭제완료!')");
			script.println("location.href='myfriends.jsp'");
			script.println("</script>");
		
		}
		
		
	%>

</body>
</html>