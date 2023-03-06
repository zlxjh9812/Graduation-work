<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.User_DAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	String userID = null;
	
	if (request.getParameter("code") != "" || !request.getParameter("code").equals("") || request.getParameter("code") != null) {
		code = request.getParameter("code");
	}

	User_DAO userDAO = new User_DAO();
	
	if (application.getAttribute("userID") != "" || application.getAttribute("userID") != null) {
		userID = (String) application.getAttribute("userID");
	}
	if (userID == "") {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	String userEmail = userDAO.getUserEmail(userID);
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code))? true:false; 
	
	if (isRight == true) {

		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();	
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();

	} else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드 입니다.');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		
		script.println(userID + "<br>"); 
		script.println(code + "<br>");
		script.println(new SHA256().getSHA256(userEmail) + "<br>");
		script.close();
	}

	
%>



