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
    <%@page import = "DeclarationChartAction.DeclarationChartDAO"%>
<%@page import = "DeclarationChartAction.DeclarationChart"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> fileUploadForm Test </title>
</head>
<body>
<%

%>
<center>
 
    <form action="DeclarationChartAction.jsp" method="post">
     <%
 String bbsID = null;
     String userID = null;
     if (session.getAttribute("userID") !=null){
     	userID = (String) session.getAttribute("userID");
     }
	if(request.getParameter("bbsID") != null){
		bbsID = request.getParameter("bbsID");
	}
   if(bbsID == null){
	   PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert(' 로그인을 해주세요.');");
  		
  		script.println("</script>");
  		script.close();
  		
  		
   }
    %>
    <table border="1">
        <tr>
            <td colspan="2" align="center"> <h3>게시물 신고하기</h3> </td>
        </tr>
        
     
        <tr>
            <td>신고사유 </td>
            <td>
            <input type = "hidden" name  = "userID" value= "userID">
            <input type="hidden" name="bbsID" value=<%=bbsID%> >
           <select name="Declaration">
			<option value="AD">과도한 광고</option>
			<option value="PIC">부적절한 사진</option>
			
			
		</select>
		</td>
            
        </tr>
     
        <tr>
            <td colspan="2" align="center"><input type="submit" value="신고하기"></td>
        </tr>
    </table>
    </form>
    
</center>
 
</body>
</html>
