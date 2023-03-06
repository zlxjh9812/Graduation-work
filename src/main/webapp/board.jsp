<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.Board" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
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
   		String bbsid = null;
   		if(request.getParameter("bbsID") != null){
   			bbsid = request.getParameter("bbsID"); 
   		}
   		Class.forName("com.mysql.jdbc.Driver");
  		String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
   		String dbID="root";
   		String dbPass="root";
   		String bbsID = null;
   		String userID = null;
   	 profileDAO pro = new profileDAO();
     String result = pro.profile(userID);
     
   		Connection con = DriverManager.getConnection(dbURL,dbID,dbPass);
   		String sql = "select*from bbs where bbsID = ?;";
		PreparedStatement pstmt = con.prepareStatement(sql);
     	pstmt.setString(1,bbsid);
    
     	ResultSet rs = pstmt.executeQuery();
    	
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
                <%
                
                if (session.getAttribute("userID") !=null){
                	userID = (String) session.getAttribute("userID");
                }
                
                
              
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
         		<div class="container-fluid px-4" id = "container" >
                        <div class="card mb-4" id ="userContent" style="border:solid 1px #adb5bd; margin:5px;">
                        
                   		<%
                   		
                               	while(rs.next()){
                               %>
                               <%
                               	if(rs.getString("fileName") != null){
                               %>
                               <div class="card-header">
                                   
                                    <td colsepan="2""><%= rs.getString("userID") %></td>
                                </div>
                      	         <img class="captuer" src="upload/<%=rs.getString("fileName")%>" alt=""  height="450" style ="margin-left:22%; max-width:55%;">
                               <%
                               	}
                               %>
                                <div class="card-header">
                                <td colsepan="2""><%=rs.getString("bbsContent") %></td>
                               
                                </div>
                                <div class="card-footer small text-muted">
                                <td colsepan="2""><%=rs.getString("bbsDate").substring(0, 11) + rs.getString("bbsDate").substring(11, 13) + "시" + rs.getString("bbsDate").substring(14,16) +  "분" %></td>
                            </div>
                            <div class="card-footer small text-muted"> 
                           
                           		
                                <tr>
								<td>
									<form type="post" action="boardAction.jsp">
										<div style="display:flex; justify-content:space-between;">
											<input type="hidden" name="bbsID" value=<%=bbsid%> >
											<textarea class="form-control" placeholder="댓글 내용" name="boardContent" maxlength="2048" style="height: 100px;"></textarea></td>
											<input type="submit" value="댓글달기" style="margin-left:10px; background-color:#0d6efd; color:white; border-radius:10px;">
										</div>
									</form>
								</tr>
								<%

									
                					BoardDAO boardDAO = new BoardDAO();
									ArrayList<Board> list = boardDAO.getBoardContent(bbsid);
									for(int i = 0; i < list.size(); i++) {
								%>
								<div style="border:solid 1px #adb5bd; margin:5px;">
									<div class="card-header" style="color:black; " >
										<div  style="display:flex;flex-direction: row-reverse;">
                                		<%
                                		if(session.getAttribute("userID").equals(list.get(i).getBoardUserID())){
                                		%>
                                		
                                		<form type="post" action="boardDeleteAction.jsp">
                                			<input type="hidden" name="boardID" value="<%=list.get(i).getBoardID() %>" >
                                			<input type="hidden" name="bbsID" value="<%=bbsid %>" >
                                			<input type="submit"class="btn btn-light"  value="댓글 삭제" >
                                		</form>
                                		<%
                                		}else{
                                		%> 
                               
                                		
                                		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 150px;">신고</button>
				<%} %>
<!-- Modal --></div>
 <form action="DeclarationTextAction.jsp" method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <tr>
            <td>신고사유 </td>
            <td>
            <input type = "hidden" name  = "userID" value= "userID">
            <input type="hidden" name="bbsID" value=<%=list.get(i).getBbsID()%> >
           <select name="Declaration">
			<option value="AD">과도한 광고</option>
			<option value="PIC">부적절한 사진</option>
			<option value="LAN">부적절한 언어</option>
			
		</select>
		</td>
            
        </tr>
      </div>
      <div class="modal-footer">
      <input type="hidden" name="boardID" value="<%=list.get(i).getBoardID() %>" >
         <input type="hidden" name="bbsID" value="<%=list.get(i).getBbsID()%>" >
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <input type="submit" class="btn btn-primary" value = "신고하기">
      </div>
    </div>
  </div>
</div>
</form>
                                	<!-- Button trigger modal -->


                                		
                                		<td colsepan="2">
                                			<%=list.get(i).getBoardUserID()%> | <%=list.get(i).getWriteDate().substring(0, 11) + list.get(i).getWriteDate().substring(11, 13) + "시" + list.get(i).getWriteDate().substring(14,16) +  "분"%>	
                                		</td>
                                		
                               	 	</div>
                               		<div class="card-header" style="color:black; background-color:white; ">
                               		 	<td colsepan="2">
                                			<%=list.get(i).getBoardContent() %>	
                                		</td>
                                	</div>
                                </div>
                             <% 
									}
                             }  	
							
						%>
                                </div>
                            </div>
						
			
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
	var frmData = document.div.frmData ;
	frmData.target = pop_title ; 
	frmData.action = "DeclarationText.jsp" ;
	frmData.submit() ; 
	} 
	</script>
	<script src="js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="js/sakura.js"></script>


    </body>
</html>