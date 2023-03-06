<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="user.User_DAO" %>
<%@page import ="profile.profile" %>
 <%@page import ="profile.profileDAO" %>
 <%@page import  = "bbs.BbsDAO" %>
 <%@page import = "bbs.Bbs" %>
 <%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>추억캘린더</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
       	<link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/evo-calendar.midnight-blue.css">
    	<link rel="stylesheet" href="css/evo-calendar.orange-coral.css">
  	  	<link rel="stylesheet" href="css/evo-calendar.royal-navy.css">
        <link rel="stylesheet" href="css/evo-calendar.css">
  		<link rel="stylesheet" href="css/evo-calendar.midnight-blue.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
    </head>
    <body class="sb-nav-fixed">
    <%
    	String userID = null;
    	String firstName = null;
    	String Name = null;
    	String userEmail = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");			
    }
    if(session.getAttribute("firstName") != null){
    	firstName = (String) session.getAttribute("firstName");			
    }
    if(session.getAttribute("Name") != null){
    	Name = (String) session.getAttribute("Name");			
    }
    if(session.getAttribute("userEmail") != null){
    	userEmail = (String) session.getAttribute("userEmail");			
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
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" action="./tableListAction.jsp">
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
                        <li><a class="dropdown-item" href="./layout-static.jsp">회원정보</a></li>
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
                             <a class="nav-link" href="layout-static.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
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
             
            <div id="calendar" ></div>
            
            
         


    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="js/evo-calendar.js"></script>
<%
User_DAO User_DAO = new User_DAO();
String Calendar =  User_DAO.UserCalendar(userID);
%>
      <script>
      
    // initialize your calendar, once the page's DOM is ready
    $(document).ready(function() {
        
        $('#calendar').evoCalendar({
        	 theme:<%=Calendar %>
      });
        
       
    })
    </script>
    <%
    
    BbsDAO bbsDAO = new BbsDAO();
      ArrayList<Bbs> list = bbsDAO.calendarDot(userID);
      for(int i = 0; i < list.size(); i++) {
    	   
           
        
   %>
  
   <script>
   $(document).ready(function() {
       
         $('#calendar').evoCalendar('addCalendarEvent', {
           id: 'kNybja6',
           <%if(!list.get(i).getBbsContent().equals("")){%>
           name: '<%=list.get(i).getBbsContent()%>',
         <%}else{%>
         name: '안녕하세요',
         <%}%>
           date: '<%=list.get(i).getBbsDate().substring(0, 10)%>',
           type: 'event'
      });
   })
   </script>
    
   
    <%
      }
   %>   
      <div class="messageIcon" onclick="javascript:openChat();"style="cursor:pointer;display:flex; font-size:40px;position:fixed; right:20px; bottom:20px; color:#0d6efd; border" >
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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
         <script src="js/calendar.js"></script>
    	  
    	 
    </body>
</html>
