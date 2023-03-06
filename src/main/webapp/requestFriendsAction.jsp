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
		String userID = null;
		String friendsID = null;
		int yNn;
		
		
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		if (request.getParameter("friendsID") != null) {
			friendsID = request.getParameter("friendsID");
		}
		
	
		

		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		FriendsDAO friendsDAO = new FriendsDAO();	
		
		int result1 = friendsDAO.request1Friends(friendsID, userID);
		
			if(result1 == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 친구 요청을 보냈습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result1 == 0){
				int result2 = friendsDAO.request2Friends(friendsID,userID);
				if(result2 == 1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 친구 요청을 받았거나 친구입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else if(result2 == 0){
					int result = friendsDAO.requestFriends(friendsID, userID,false);
					if(result == -1){// 데이터베이스 오류인 경우
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('데이터 베이스 오류.')");
						script.println("history.back()");
						script.println("</script>");
					}else if(result == 1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('친구요청완료!')");
						script.println("location.href='tables.jsp'");
						script.println("</script>");
					}	
				}
		}
		
		
	%>

</body>
</html>