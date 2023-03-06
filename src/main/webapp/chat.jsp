<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
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
<body>
<%
    	String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");			
    }
    
   Class.forName("com.mysql.jdbc.Driver");
   String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
   String dbID="root";
   String dbPass="root";
   String searchName = null;

   Connection con = DriverManager.getConnection(dbURL,dbID,dbPass);
   String sql = "select*from friends where yNn = 1 and (userID =? or friendsID = ?);";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,userID);
   pstmt.setString(2,userID);
   ResultSet rs = pstmt.executeQuery();

    %>
     <ul class="friends_list">
                   
                 		 <%
                 		 
                 			while(rs.next()){
								if(rs.getString("friendsID").equals(userID)){
									
						
                		  %>
               	        	<form id="frm" method="post" action="privateChat.jsp">
               	        		<div>
                        			<img src="./img/kakao_1.jpg" alt="">
                        			<%=rs.getString("userID") %>
                        		</div>
                        		<input type="hidden" name="toID" value=<%=rs.getString("userID") %>> 
                        		<input type="submit" value="메시지보내기" style="font-size:10px!important;">
                        		
                    		</form>
                    	
                  		 <%
						}else{
							
							%>
							<form id="frm" method="post" action="privateChat.jsp">
               	        		<div>
                        			<img src="./img/kakao_1.jpg" alt="">
                        			<%=rs.getString("friendsID") %>
                        		</div>
                        		<input type="hidden" name="toID" value=<%=rs.getString("friendsID") %>>   
                        		<input type="submit" value="메시지보내기" style="font-size:10px!important;">
                        		                		
                    			
                    		</form>
							
						<%	
								
                 			}
                 		}
                  
                    	%>
                   
                    </ul>
                    
</body>
</html>