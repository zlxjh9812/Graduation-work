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
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		FriendsDAO friendsDAO = new FriendsDAO();	
		
		int result1 = friendsDAO.request1Friends(friendsID, userID);
		
			if(result1 == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�̹� ģ�� ��û�� ���½��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result1 == 0){
				int result2 = friendsDAO.request2Friends(friendsID,userID);
				if(result2 == 1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�̹� ģ�� ��û�� �޾Ұų� ģ���Դϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				}else if(result2 == 0){
					int result = friendsDAO.requestFriends(friendsID, userID,false);
					if(result == -1){// �����ͺ��̽� ������ ���
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('������ ���̽� ����.')");
						script.println("history.back()");
						script.println("</script>");
					}else if(result == 1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('ģ����û�Ϸ�!')");
						script.println("location.href='tables.jsp'");
						script.println("</script>");
					}	
				}
		}
		
		
	%>

</body>
</html>