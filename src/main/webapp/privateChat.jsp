<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="chat.ChatDTO" %>
    <%@ page import="chat.ChatDAO" %>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");			
	}
	String toID = null;
	if(request.getParameter("toID") != null){
		toID = (String) request.getParameter("toID");
		
	}
%>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> 추억캘린더</title>
        <link rel="stylesheet" href="css/friends.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
       
</head>
<title>채팅</title>
</head>
<body>
<%
	ChatDAO chatDAO = new ChatDAO();
	ArrayList<ChatDTO> list = chatDAO.getChatContent(userID,toID);
	
%>
			<form type="post" action="chatAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;height:100%;">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">채팅창</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 350px;">
									<%
									for(int i = 0; i < list.size(); i++) {
									if(list.get(i).getFromID().equals(userID)){
									%>
									<div style="text-align:right; margin:10px;">
										<p style="margin:5px;">
										<%=list.get(i).getFromID()%>
										</p>
										<h style="background-color:#FAED7D; border-radius:10px;padding:10px;">
											<%=list.get(i).getChatContent() %>
										</h>
									</div>
									<%
										}else if(!list.get(i).getFromID().equals(userID)){
									%>
									<div style="text-align:left; margin:10px;">
										<p style="margin:5px;">
											<%=list.get(i).getFromID()%>
										</p>
										<h style="background-color:white; border-radius:10px;padding:10px; ">
											<%=list.get(i).getChatContent() %>
										</h>
									</div>
									<%
										}
									}
									%>
								</div>
							</td>
						</tr>
						
						<tr>
							<td style="display:flex; justify-content:space-between; ">
								<textarea class="form-control" placeholder="메시지를 입력해주세요." name="chatContent" maxlength="100" style="height: 60px; margin:5px;"></textarea>
								<input type="hidden"  name="toID"value="<%=toID %>">
								<input type="submit" class="btn btn-default" value="전송" style="width:68px; margin:5px; border:solid 1px black;">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
	
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
		<!-- 채팅 스크롤 하단으로 보내기 -->
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	
</script>
 
</body>
</html>