<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
     <%@page import ="profile.profile" %>
 <%@page import ="profile.profileDAO" %>
    <%@ page import="java.sql.Connection" %>
    <%@page import="like.LikeDAO"%>
<%@page import="like.Like" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Charts - SB Admin</title>
        <style type="text/css">
         a, a:hover {
         color: #000000;
         text-decoration:none;
         }
        </style>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <link href="css/charts.css" rel="stylesheet">
        <link href = "css/profileindex.css" rel = "stylesheet">
    

    </head>
    <body class="sb-nav-fixed">
    
   <%
   
   		Class.forName("com.mysql.jdbc.Driver");
  		String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
   		String dbID="root";
   		String dbPass="root";
   		int bbsi = 0;
   		
   		Connection con = DriverManager.getConnection(dbURL,dbID,dbPass);
     	
    	
   %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
             <a class="navbar-brand ps-3" href="index.jsp">
             <img src="./img/main.png"style="width: 40px; height: 40px;" >
            ???????????????
            
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
                        <li><a class="dropdown-item" href="#">????????????</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./userLogoutAction.jsp">????????????</a></li>
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
                                ??????
                            </a>
                            
                            <a class="nav-link collapsed" href="layout-static.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ????????????
                           
                            </a>
                       
                            
                            <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                ?????????
                            </a>
                            <a class="nav-link" href="tables.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ????????????
                            </a>
                        </div>
                    </div>
                    <%
                    String userID = null;
                    
                    if (session.getAttribute("userID") !=null){
                    	userID = (String) session.getAttribute("userID");
                    }
                    profileDAO pro = new profileDAO();
                	   String result = pro.profile(userID); 
                	   
                	   %>
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
              
              
                %>
                <%
        			if(userID == null){
        			PrintWriter script = response.getWriter();
       				script.println("<script>");
       				script.println("alert(' ???????????? ????????????.');");
       				script.println("location.href='login.jsp';");
       				script.println("</script>");
       				script.close();
       				return;
       				 }
       			 %>
         		<div class="container-fluid px-4" id = "container">
                        
                            
                       
                        <div class="card mb-4" id ="userContent" >
                        <a href="write.jsp" class="btn btn-primary pull-right">?????????</a>
                            <div class = "card-header" id="UserStory">
                             
                                <h2><%=userID %> ?????? ?????????</h2>
                            </div>
                   		<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getUserContetn(userID);
							
							
							for(int i = 0; i < list.size(); i++) {
								bbsi = list.get(i).getBbsID();
								String sql = "select*from bbs where bbsID = ?;";
								PreparedStatement pstmt = con.prepareStatement(sql);
								  
						     	pstmt.setInt(1,bbsi);
						    
						     	ResultSet rs = pstmt.executeQuery();
						     	 String result1 = pro.profile(userID);
						%>
						
						<div class="card mb-4" id="ImgStyle" style="border:solid 1px #adb5bd;">
                               <form type="post" action="updateChart.jsp"> 
                                	<div class="card-header"  style="display:flex; justify-content:space-between;">
                                		<input type="hidden" name="bbsID" value="<%=list.get(i).getBbsID() %>">
                                		
                                    	<td colsepan="2"">
                                    	<div>
                                    	<%if(result1 == null){ %>
                                    	<img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="./img/kakao_1.jpg">
                                    	<%}else{ %>
                                    	<img style="width: 40px; height: 40px; border-radius: 50%;" id="preview-image" src="profile/<%=result1%>">
                                    	<%} %>
                                    	<%= list.get(i).getUserID() %> 
                                    	</div>
                                    	<nav style = "display : flex;">
                                    		<%
                                		if(session.getAttribute("userID").equals(list.get(i).getUserID())){
                                		%>
                                    	<input type="submit" value="????????? ??????" class="btn btn-light">
                                    	</form>
                            <%}else{ %>
                                <td colsepan="2"">
                                
                                <button type="button"  class = "btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">??????</button>
                                <%} %>
                                <!-- Modal -->
 <form action="DeclarationChartAction.jsp" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">????????????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <tr>
            <td>???????????? </td>
            <td>
            <input type = "hidden" name  = "userID" value= "userID">
            <input type="hidden" name="bbsID" value=<%=list.get(i).getBbsID()%> >
           <select name="Declaration">
			<option value="AD">????????? ??????</option>
			<option value="PIC">???????????? ??????</option>
			<option value="LAN">???????????? ??????</option>
			
		</select>
		</td>
            
        </tr>
      </div>
      <div class="modal-footer">
      
         <input type="hidden" name="bbsID" value="<%=list.get(i).getBbsID()%>" >
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
        <input type="submit" class="btn btn-primary" value = "????????????">
      </div>
    </div>
  </div>
</div>
</form>
                                	<!-- Button trigger modal -->
                                </td>
                                
                         
                                    </nav>
                                    	</td>
                                	
                                	
                              
                             
                             </div>
                             
                               <%
                               	while(rs.next()){
                               		if(rs.getString("fileName") != null){
                               			
                               %>
                      	         <img class="captuer" src="upload/<%=rs.getString("fileName")%>" alt=""  height="450" style ="margin-left:22%; max-width:55%;">
                               <%
                               	}
                               %>
                                <div class="card-header">
                                <td colsepan="2""><%=list.get(i).getBbsContent() %></td>
                               
                               
                                </div>
                                <div class="card-footer small text-muted">
                                <td colsepan="2""><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "???" + list.get(i).getBbsDate().substring(14,16) +  "???" %></td>
                            </div>
                            <div class="card-footer small text-muted"> 
                           <FORM type="post" action="board.jsp">
                            <%
                           	LikeDAO likeDAO = new LikeDAO();
                            int result2 = likeDAO.CountLike(list.get(i).getBbsID());
                            
                            %>
                                <td colsepan="2"">
                                <div style="margin:5px; font-size:18px;">
                                	<i class="fas fa-thumbs-up" ></i> 
                                	<%=result2 %>
                                	
                                </div>
                                	<input type="hidden" name="bbsID" value=<%=list.get(i).getBbsID() %>>
                                	<input id="add" type="submit" value="?????????" onclick="return likeAdd(this.form)" style="display:show;text-decoration:none; color:black; padding:5px; border:solid 1px black; border-radius:10px;"> 
                                	<input type="submit" value="??????" style="text-decoration:none; color:black; padding:5px; border:solid 1px black; border-radius:10px;">
                                </td>   
                             </FORM>
                              
                                </div>
                            </div>
						<% 
                               	}
							}
						%>
			
		</div>
	</div>     	
                    <div class="messageIcon" onclick="javascript:openChat();"style="cursor:pointer;display:flex; font-size:40px;position:fixed; right:20px; bottom:20px; color:#0d6efd; border" >
              <i class="fas fa-comment-dots"></i>
              </div>
                   
                   
                </main>
            </div>
        </div>
 <script >
        function openChat(){
        	window.open("./chat.jsp","??????","width=400,height496,resizable=no,menubar=no,toolbar=no,location=no")
        }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript" language="javascript"> 
// ?????????????????? ???????????? Post ??????
function openPop(){ 
	
	  var width = 500; var height = 500; 
      //pc???????????? ????????? ??????
       var left = (window.screen.width / 2) - (width/2); var top = (window.screen.height / 4); 
      //????????? ?????? ?????? 
      var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
     
	var pop_title = "popupOpener" ;
	window.open("", pop_title ,windowStatus) ;
	var frmData = document.frmData ;
	frmData.target = pop_title ; 
	frmData.action = "DeclarationChart.jsp" ;
	frmData.submit() ; 
	} 
	</script>
	
	<script > 
 			function likeAdd(frm) { 
    			frm.action='likeAction.jsp';
    			frm.submit();
    				
    			return true;    
    		
    			
  			} 
		</script>


		 <script src="./js/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="js/sakura.js"></script>


    </body>
</html>