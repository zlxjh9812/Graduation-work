package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ChatDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	public ChatDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return"";
	}
	
	
	
     public int write( String fromID, String toID, String chatContent) {
 		String SQL = "INSERT INTO chat VALUES(NULL, ?, ?, ?, ?)";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			pstmt.setString(1, fromID);
 			pstmt.setString(2, toID);
 			pstmt.setString(3, chatContent);
 			pstmt.setString(4, getDate());
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
     
   
     public ArrayList<ChatDTO> getChatContent(String userID,String toID) {
    	 String SQL = "SELECT* FROM chat WHERE (fromID = ? AND toID = ?) or (fromID = ? AND toID = ?) ORDER BY chatID  ";
    	 ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			 pstmt.setString(1, userID);
 			 pstmt.setString(2, toID);
 			 pstmt.setString(3, toID);
 			pstmt.setString(4, userID);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				ChatDTO chat = new ChatDTO();
 				chat.setChatID(rs.getInt(1));
 				chat.setFromID(rs.getString(2));
 				chat.setToID(rs.getString(3));
 				chat.setChatContent(rs.getString(4)); 
 				chat.setChatTime(rs.getString(5));
 				list.add(chat);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     } 
  

   
     

}
