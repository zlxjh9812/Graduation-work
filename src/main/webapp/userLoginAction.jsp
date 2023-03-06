<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.User_DAO" %>

<%@page import = "util.SHA256" %>
<%@page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassWord = null;	
	
	if(request.getParameter("userID") != null){
		userID = (String) request.getParameter("userID");
   	}
   	if(request.getParameter("userPassWord")  != null){
   		userPassWord = (String) request.getParameter("userPassWord");
   	}
   	
   	if(userID == "" || userPassWord == ""){
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert(' 입력이 안된 사항이 있습니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
   		return;
   	}
   	

   	User_DAO UserDAO = new User_DAO();
   	int result = UserDAO.login(userID, SHA256.getSHA256(userPassWord));
    boolean emailChecked = new User_DAO().UserEmailChecked(userID);
    
  	if(userID.equals("ROOT")&&userPassWord.equals("ROOT")){
  		session.setAttribute("userID",userID);
  		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('관리자 권한으로 접속합니다');");
   		script.println("location.href='manage.jsp'");
   		script.println("</script>");
   		script.close();
  		
  	}
   	if (result == 1 && emailChecked == true){
   		
   		session.setAttribute("userID",userID);
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("location.href='index.jsp'");
   		script.println("</script>");
   		script.close();
   		return;
   		}
   		else if(result ==1 && emailChecked == false){
   			PrintWriter script = response.getWriter();
   	   		script.println("<script>");
   	   	
   	   		script.println("alert('인증되지 않은 회원입니다.인증 후에 다시 시도해주세요');");
   	   	script.println("history.back();");
   	   				
   	   		script.println("</script>");
   	   		script.close();
   	   		return;
   		}
   		
   	else if(result == 0){
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('비밀번호가 틀립니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
   		return;
   	}else if(result == -1){
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('존재하지 않는 아이디입니다.');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
   		return;
   	}else if(result == -2){
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('데이터베이스 오류!');");
   		script.println("history.back();");
   		script.println("</script>");
   		script.close();
   		return;
   	}else if(result == 2){
   		PrintWriter script = response.getWriter();
   		script.println("<script>");
   		script.println("alert('관리자 권한으로 접속합니다');");
   		script.println("location.href='manage.jsp'");
   		script.println("</script>");
   		script.close();
   		
   	}
  
    
 
   
   

%>