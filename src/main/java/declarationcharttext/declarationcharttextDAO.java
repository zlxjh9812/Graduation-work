package declarationcharttext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class declarationcharttextDAO {
	private Connection conn;
	private ResultSet rs;
	
	
	public declarationcharttextDAO() {
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
	

	public int DeclarationText(String bbsID, String declarationchartText,String userID) {
 		String SQL = "INSERT INTO declarationcharttext VALUES(?, ?,?);";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, bbsID); 
 			pstmt.setString(2, declarationchartText);
 			pstmt.setString(3, userID);
 		
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
	
}
