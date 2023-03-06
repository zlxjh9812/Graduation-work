<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3></div>
                                    <div class="card-body">
                                        <form action="./ResetPW.jsp" method="post">
                                           
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="text" placeholder="name@example.com" name="userID" />
                                                <label for="inputEmail">아이디</label>
                                              
                                              
                                              
                                            </div>
                                               <div class="form-floating mb-3">
                                                <input class="form-control" type="email" placeholder="name@example.com" name="userEmail" />
                                                <label for="inputEmail">Email</label>
                                              
                                              
                                              
                                            </div>
                                            
                                               
                                                
                                            </div>
                                            <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                              <input class="btn btn-primary btn-block" type="submit" value="비밀번호 재설정"  >
                                              </div>
                                              
                                        </form>
                                       
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login.jsp">로그인하러 가기</a></div>
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