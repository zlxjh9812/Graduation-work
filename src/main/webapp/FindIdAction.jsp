<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.User_DAO" %>
   <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
<%
request.setCharacterEncoding("UTF-8");
User_DAO DAO = new User_DAO();
String userEmail = null;

if (application.getAttribute("userEmail") != null) {
	userEmail = (String) application.getAttribute("userEmail");
}
String result = DAO.FindId(userEmail);
if(result == null){
	PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('존재하지 않는 이메일입니다 다시 확인해주세요');");
		  script.println("history.back()"); 	
			
		script.println("</script>");
		script.close();
		//return;
}

	
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>이메일 인증</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body>

    	
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                            
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">이메일 인증</h3></div>
                                    <div class="card-body">
                                        	<section class="container mt-3" style="max-width: 560px;">
													<div class="arert mt-4" role="alert">
																	회원님의 아이디는<br>
																	<%=result%>입니다.
														
																</div>
																<br>
																<input class="btn btn-primary" onClick = "location.href = 'login.jsp';" type="submit" value="로그인 하러가기">
															</section>
														                                   
														 </div>
														
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
           
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src = "js/Login.js"></script>
    </body>
</html>
