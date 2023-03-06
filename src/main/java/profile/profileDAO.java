package profile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.Database_Util;

public class profileDAO {
	
	private Connection conn;
	private ResultSet rs;
	public profileDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/tutoreal";
			String dbID = "root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int Editprofile(String userID,String userPic) {
		String SQL = "INSERT INTO profile VALUES(?, ?)";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, userID);
 			pstmt.setString(2, userPic);
 			
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
	}
	

	public String profile(String userID) {
		String SQL = "select userPic from USER where userID = ?;";
		String propic = null;
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, userID);
 			rs=pstmt.executeQuery();
 			if(rs.next()) {
 				propic=rs.getString("userPic"); 
 			}
 			
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return propic; 
	}
}
