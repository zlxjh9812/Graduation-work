<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.User_DAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");
String userID = null;
if (application.getAttribute("userID") != null) {
	userID = (String) application.getAttribute("userID");
}
if (userID == null) {
	
	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	script.close();
	return;
}
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
 
    <body >
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호변경</h3></div>
                                    <div class="card-body">
                                        <form action="./PassWord.jsp" method="post">
                                           
                                            <div class="form-floating mb-3">
                                                <input class="form-control"  type="password"  name="userPassWord" />
                                                        <label for="inputPassword">비밀번호</label>
                                              
                                              
                                              
                                            </div>
                                               <div class="form-floating mb-3">
                                               <input class="form-control"  type="password"  name="userPassWord2" />
                                                        <label for="inputPasswordConfirm">비밀번호 확인</label>
                                              
                                              
                                              
                                            </div>
                                            
                                           
                                                
                                            </div>
                                            <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                              <input class="btn btn-primary btn-block" type="submit" value="재설정"  >
                                              </div>
                                              
                                        </form>
                                       
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
         
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src = "js/IdCheck.js"></script>
    </body>
</html>