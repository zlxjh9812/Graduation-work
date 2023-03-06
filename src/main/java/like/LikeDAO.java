package like;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

 
public class LikeDAO {

	private Connection conn;
	private ResultSet rs;
	
	public LikeDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
			String dbID = "root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int AddLike(String bbsID, String userID) {
 		String SQL = "INSERT INTO likes VALUES(?, ?);";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, bbsID); 
 			pstmt.setString(2, userID);
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
	
	public int DeleteLike(String bbsID, String userID) {
 		String SQL = "DELETE FROM likes where bbsID = ? and userID = ? ;";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, bbsID); 
 			pstmt.setString(2, userID);
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
	
	public int CountLike(int bbsID) {
 		String SQL = "SELECT count(*) FROM likes where bbsID = ?; ";
 		int countlike = 0;
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setInt(1, bbsID);
 			rs = pstmt.executeQuery();
 			if(rs.next()) {
 				countlike = rs.getInt("count(*)");
 			}
 			return countlike;
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return countlike; 
     }
	
	
}
