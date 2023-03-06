<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="user.USER_DTO" %>
<%@page import="user.User_DAO" %>
<%@page import="java.io.PrintWriter" %>

<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

   <form action ="./userIdCheck.jsp"method ="post" name = "UserIdCheck">
   <input type="text" placeholder="아이디를 입력해주세요">
   <button>중복확인</button>
   </form>
</body>
</html>