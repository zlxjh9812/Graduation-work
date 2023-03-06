<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> fileUploadForm Test </title>
</head>
<body>
 <%
  	String userID = null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");			
    }
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
<center>
 
    <form action="EditAction.jsp" method="post" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td colspan="2" align="center"> <h3>프로필 사진 변경</h3> </td>
        </tr>
        
     
        <tr>
            <td>파일명: </td>
            <td><input type="file" name="userPic" onchange="setThumbnail(event);"></td>
        
        </tr>
   <tr>
   <td>사진 미리보기 </td>
	<td id="image_container"></td>
   </tr>
    
     
        <tr>
            <td colspan="2" align="center"><input type="submit" value="변경"></td>
        </tr>
    </table>
    </form>
    
</center>
 	<script>
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			img.setAttribute("style","width: 100px;");
			document.querySelector("td#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
	</script>
</body>
</html>
