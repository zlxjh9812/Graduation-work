package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class fileDAO {
	private Connection conn;
	public fileDAO() {
	try {
		String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
		String dbID = "root";
		String dbPassword="root";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn =  DriverManager.getConnection(dbURL, dbID, dbPassword);
		
	}catch(Exception e) {
		e.printStackTrace();
	}
}
	public int upload(String FileName,String FileRealName) {
		String SQL = "insert into FILE VALUE(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt = conn.prepareStatement(SQL);
		      pstmt.setString(1,FileName);
		      pstmt.setString(2,FileRealName);
		      return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
}