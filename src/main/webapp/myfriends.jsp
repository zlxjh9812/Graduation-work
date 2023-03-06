<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
  <%@page import="user.USER_DTO" %>
<%@page import="user.User_DAO" %>
 <%@page import ="profile.profile" %>
 <%@page import ="profile.profileDAO" %>
<!DOCTYPE html>
<html lang="ko">
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
    <body class="sb-nav-fixed">
    <%
    	String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");			
    }
    if(userID == null){
    	PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert(' 로그인을 해주세요.');");
   		script.println("location.href='login.jsp';");
   		script.println("</script>");
   		script.close();
   		return;
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
   

   profileDAO pro = new profileDAO();
   String result = pro.profile(userID);

   
    %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
           <a class="navbar-brand ps-3" href="index.jsp">
             <img src="./img/main.png"style="width: 40px; height: 40px;" >
            추억캘린더
            
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" action="<%=request.getContextPath() %>/tableList.jsp">
                <div class="input-group" >
                    <input class="form-control" name="searchName" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">회원정보</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./userLogoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                달력
                            </a>
                            
                            <a class="nav-link collapsed" href="layout-static.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원정보
                           
                            </a>
                            
                            
                            
                            <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                               	게시물
                            </a>
                            <a class="nav-link" href="tables.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                              	친구찾기
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                         <div class="small">Logged in as:</div>
                        <%if(result == null) {%>
                        	<img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="./img/kakao_1.jpg">
                        	<%}else{ %>
                        <img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="profile/<%=result%>">
                    <%} %>
                         <%=session.getAttribute("userID") %>
                          </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>

                    <div class="friends">    
                       	<span>내 친구 목록</span>
                       	<div>
                        	<a  href="tables.jsp" style="text-decoration:none; color:white; background-color:#0d6efd; border-color:#0d6efd; font-size:20px; padding:5px; margin-bottom:20px; border-radius:10px;margin-top:20px;">친구찾기</a>
                    	 	<a  href="requestfriends.jsp" style="text-decoration:none; color:white; background-color:#0d6efd; border-color:#0d6efd; font-size:20px; padding:5px; margin-bottom:20px; border-radius:10px;margin-top:20px;">친구요청</a>
                    	</div>
                    </div>
                    
                    <ul class="friends_list">
                   
                 		 <%
                 		 
                 			while(rs.next()){
								if(rs.getString("friendsID").equals(userID)){
									
									
                		  %>
                		  
                		 
               	        	<form method="post" action="friendcontent.jsp">
               	        	<%
               	         String result1 = pro.profile(rs.getString("userID"));
                        		
                        		%>
               	        		<div>
               	        		<%if(result1 == null){ %>
               	        		<img src="./img/kakao_1.jpg" alt="">
               	        		<%}else{ %>
                        			 <img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="profile/<%=result1%>">
                        			<%} %>
                        			<%=rs.getString("userID") %>
                        		</div>
                        		
                        		<input type="hidden" name="friendsID" value=<%=rs.getString("userID") %>> 
                        		<div class = "BTN">
                        			<input type="submit"  value="게시물보기">
                        			<input type="submit"  value="친구삭제" onclick="return dropfriends(this.form)">                 		
                    			</div>
                    		</form>
                    	
                  		 <%
						}else{
							String result2 = pro.profile(rs.getString("friendsID"));
							%>
							<form method="post" action="friendcontent.jsp">
               	        		<div >
               	        		<%if(result2 == null){ %>
               	        		<img src="./img/kakao_1.jpg" alt="">
               	        		<% }else{%>
                        			<img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="profile/<%=result2%>">
                        			<%} %>
                        			<%=rs.getString("friendsID") %>
                        			
                        		</div>
                        		<input type="hidden" name="friendsID" value=<%=rs.getString("friendsID") %>>                		
                    			<div class = "BTN">
                    				<input type="submit"  value="게시물보기">
                    				<input type="submit"  value="친구삭제" onclick="return dropfriends(this.form)">               		
                    			</div>
                    		</form>
							
						<%	
						}
                 			}
                 		
                  
                    	%>
                   
                    </ul>
                     <div class="messageIcon" onclick="javascript:openChat();"style="cursor:pointer;display:flex; font-size:40px;position:absolute; right:20px; bottom:20px; color:#0d6efd; border" >
              <i class="fas fa-comment-dots"></i>
              </div>
                </main>
                    
                
            </div>
        </div>
            <script >
        function openChat(){
        	window.open("./chat.jsp","채팅","width=400,height496,resizable=no,menubar=no,toolbar=no,location=no")
        }
        </script>
        <script> 
 			function dropfriends(frm) { 
    			frm.action='dropfriends.jsp'; 
    			frm.submit(); 
    			return true; 
  			} 
		</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
