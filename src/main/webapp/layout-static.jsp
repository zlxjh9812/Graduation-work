<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
        <%@page import="java.io.PrintWriter"%>
        <%@page import="java.util.ArrayList" %>
        <%@page import ="profile.profile" %>
         <%@page import ="profile.profileDAO" %>
    <%@page import="bbs.Bbs"%>
    <%@page import="bbs.BbsDAO"%>
   <%
   	String userID = (String)session.getAttribute("userID");
   	Class.forName("com.mysql.jdbc.Driver");
   	String dbURL = "jdbc:mysql://localhost:3306/TUTOREAL";
   	String dbID ="root";
   	String dbPass = "root";
   	Connection con = DriverManager.getConnection(dbURL,dbID,dbPass);
   	String sql = "select*from user where userID = ?";
   	PreparedStatement pstmt = con.prepareStatement(sql);
   	pstmt.setString(1,userID);
   	ResultSet rs = pstmt.executeQuery();
   	
   
   	
   	if(userID == null){
    	PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert(' 로그인을 해주세요.');");
   		script.println("location.href='login.jsp';");
   		script.println("</script>");
   		script.close();
   		return;
   		
   		
    }
   %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <link rel="stylesheet" href="./css/UserProfile.css">
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Charts - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
         <link href="css/styles.css" rel="stylesheet" />
        <link href="css/UserProfile.css" rel="stylesheet" />
        <link href = "css/profileindex.css" rel = "stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
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
                    <%profileDAO pro = new profileDAO();
                	   String result = pro.profile(userID); %>
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
               
               <% 
                Bbs bbs = new BbsDAO().getUserContent(userID);
               int pageNumber = 1;
               if(request.getParameter("pageNumber") != null) {
               	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
               }
               
                %>
                    <div class="container-fluid px-4" id = "container">
                        <h1 class="mt-4">내 정보</h1> 
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item" id="PageBtn">
                            
                        </ol>
                        <div  class="card mb-4" id=" UserText">
                            <div class="card-body" id="Profile">
                              <ul class="myInfo" >
                              <%while(rs.next()){ %>
                              	<li>이름 : <%=rs.getString("firstName") %><%=rs.getString("Name") %></li>
                              	<li>이메일 : <%=rs.getString("userEmail") %></li>   
                                                    	
                              </ul>
                              <%
                              
                              String result1 = pro.profile(userID);
                          if(result1 == null){
                              %>
                              <img style="width: 80px; height: 80px;" id="preview-image" src="./img/kakao_1.jpg">
                              <%}else{%>
                              <img style="width: 80px; height: 80px;" id="preview-image" src="profile/<%=result1%>">
                                	<%} 
                                	}%>  
                            </div>
                            <div class="ProFileBtn" style="margin-left: 10px;margin-bottom: 10px ;">
                               
                                                     <td colsepan="2"">
                                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">내 이미지 변경</button>
                                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal2">달력 디자인 변경</button>
                                <!-- Modal -->
     <form action="EditAction.jsp" method="post" enctype="multipart/form-data">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">프로필 사진 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <tr>
          <table style="height: 136.078px;">
        <tr>
       
        </tr>
        
     
        <tr>
          
            <td><input type="file" name="userPic" onchange="setThumbnail(event);"></td>
        
        </tr>
   <tr style="display: flex;">
   <td >사진 </td>
	<td id="image_container"></td>
   </tr>
    
     
    </table>
        </tr>
      </div>
      <div class="modal-footer">
      
       
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <input type="submit" class="btn btn-primary" value = "변경하기">
      </div>
    </div>
  </div>
</div>
</form>
                                	<!-- 이미지 변경 모달 -->
                <form action="EditCalendear.jsp" method="post">
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">달력 디자인 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <tr>
            <td> 달력 디자인 변경 </td>
            <td>
            <input type = "hidden" name  = "userID" value= "userID">
              <select name="claendar">
			<option value="'Midnight Blue'">Midnight Blue</option>
			<option value="'Royal Navy'">Royal Navy</option>
			<option value="'Orange Coral'">Orange Coral</option>
			<option value="'default'">Original</option>
			
		</select>
		</td>
   
        </tr>
       <div><br></div>
        <div style="justify-content: space-around; display: flex;">
      			<div style=" display: flex;flex-direction: column;align-items: center;">
        	  	<img src="./img/Midnight Blue.PNG"style="width: 200px; height: 80px;" >
            	<h3 style = "font-size:15px">Midnight Blue</h3>
            	</div>
             	 <div style=" display: flex;flex-direction: column;align-items: center;">
          		 <img src="./img/Royal Navy.PNG"style="width: 200px; height: 80px;" >
           		 <h3 style = "font-size:15px">Royal Navy</h3>
           		 </div>
       </div>
        <div><br></div>
           <div style="justify-content: space-around; display: flex;">
      			<div style=" display: flex;flex-direction: column;align-items: center;">
        	  	<img src="./img/Orange Coral.PNG"style="width: 200px; height: 80px;" >
            	<h3 style = "font-size:15px">Orange Coral</h3>
            	</div>
             	 <div style=" display: flex;flex-direction: column;align-items: center;">
          		 <img src="./img/default.PNG"style="width: 200px; height: 80px;" >
           		 <h3 style = "font-size:15px">Original</h3>
           		 </div>
       </div>
      </div>
      <div class="modal-footer">
              
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <input type="submit" class="btn btn-primary" value = "변경하기">
      </div>
    </div>
  </div>
</div>
</form>
<!-- 달력 변경 모달 -->
                                </td>
                            </div>
                            
                        </div>
                        
                        <div class="messageIcon" onclick="javascript:openChat();"style="cursor:pointer;display:flex; font-size:40px;position:absolute; right:20px; bottom:20px; color:#0d6efd; border" >
              <i class="fas fa-comment-dots"></i>
              </div>
                 
                </main>
                
            </div>
        </div>
        <script>
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style","width: 100px;");
			document.querySelector("td#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
	</script>
         <script >
        function openChat(){
        	window.open("./chat.jsp","채팅","width=400,height496,resizable=no,menubar=no,toolbar=no,location=no")
        }
        </script>
        <script src="./js/UserProfile.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
    </body>
</html>
