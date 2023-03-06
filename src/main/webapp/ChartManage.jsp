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
    <%@page import = "DeclarationChartAction.DeclarationChartDAO"%>
<%@page import = "DeclarationChartAction.DeclarationChart"%>
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
   		
   		
    	
   %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">추억캘린더</a>
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
                            
                            <a class="nav-link" href="manage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>  
                                달력
                            </a>
                             <a class="nav-link" href="BoardManage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                댓글 신고 관리
                            </a>
                                     
                            <a class="nav-link" href="ChartManage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                게시물 신고 관리
                            </a>
                            <a class="nav-link" href="AllUser.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            	모든 유저 보기  
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
       				script.println("alert(' 로그인을 해주세요.');");
       				script.println("location.href='login.jsp';");
       				script.println("</script>");
       				script.close();
       				return;
       				 }
       			 %>
         		<div class="container-fluid px-4" id = "container">
                        
                            
                       
                        <div class="card mb-4" id ="userContent" >
                      
                            <div class = "card-header" id="UserStory">
                            
                                <h2>신고받은 게시물</h2>
                            </div>
                   		<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getlist();
							
							
							for(int i = 0; i < list.size(); i++) {
								   Connection con = DriverManager.getConnection(dbURL,dbID,dbPass);
								   String sql = "SELECT* FROM declarationchart WHERE bbsID = ? ORDER BY bbsID DESC;";
								   PreparedStatement pstmt = con.prepareStatement(sql);
								   pstmt.setInt(1,list.get(i).getBbsID());
								  
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
                                    	
                                    	</form>
                            
                                <td colsepan="2"">
                                <form  type="post" action="deleteChart.jsp">
                                	<input type="hidden" name="bbsID" value="<%=list.get(i).getBbsID() %>">
                                	<input type="hidden" name="userID" value="<%=list.get(i).getUserID()%>">
                              <input type="hidden" name="userCO" value="<%=list.get(i).getBbsContent()%>">
                                	<input type="submit" value="게시물 삭제">
                              </form>
                                <form  type="post" action="reportChart.jsp">
                                	<input type="hidden" name="bbsID" value="<%=list.get(i).getBbsID() %>">
                                	<input type="hidden" name="userID" value="<%=list.get(i).getUserID()%>">
                              <input type="hidden" name="userCO" value="<%=list.get(i).getBbsContent()%>">
                                	<input type="submit" value="게시물 삭제 철회">
                              </form>
                                </td>
                                
                         
                                    </nav>
                                    	</td>
                                	
                                	
                              
                             
                             </div>
                             
                               <%
                               	
                               		if(list.get(i).getFileName() !=null){
                               			
                               %>
                      	         <img class="captuer" src="upload/<%=list.get(i).getFileName()%>" alt=""  height="450" style ="margin-left:22%; max-width:55%;">
                               <%
                               		}
                               %>
                                <div class="card-header">
                                <td colsepan="2""><%=list.get(i).getBbsContent() %></td>
                               
                               
                                </div>
                                <div class="card-footer small text-muted">
                                <td colsepan="2""><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14,16) +  "분" %></td>
                            </div>
                            <div class="card-footer small text-muted"> 
                           <FORM type="post" action="board.jsp">
                            <%
                           	LikeDAO likeDAO = new LikeDAO();
                            int result2 = likeDAO.CountLike(list.get(i).getBbsID());
                            
                            %>
                            
                                <td colsepan="2"">
                               
                                  <%
                             
                              %>
                              
                              <%
                              while(rs.next()){
                              %>
                              <td colsepan="2""><%=rs.getString("Declaration") %></td><br>
                              <input type="hidden" name="userID" value="<%=list.get(i).getUserID()%>">
                              <input type="hidden" name="userCO" value="<%=list.get(i).getBbsContent()%>">
                              <%} %>
                             
                                	</td>   
                                	  </form>
                             </FORM>
                             <div class="card-footer small text-muted"> 
                              
                            
                              
                              </div>
                                </div>
                            </div>
						<% 			
                               	
							}
						%>
			
			
		</div>
	</div>     	
                   
                   
                   
                </main>
            </div>
        </div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
$(window).load(function () {
    $('body').sakura();
});
</script>
<script type="text/javascript" language="javascript"> 
// 팝업오픈하여 폼데이터 Post 전송
function openPop(){ 
	
	  var width = 500; var height = 500; 
      //pc화면기준 가운데 정렬
       var left = (window.screen.width / 2) - (width/2); var top = (window.screen.height / 4); 
      //윈도우 속성 지정 
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