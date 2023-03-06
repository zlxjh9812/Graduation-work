package friends;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;
import util.Database_Util;

public class FriendsDAO {
	private Connection conn;
	private ResultSet rs;
	
	
	public FriendsDAO() {
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
	public int request1Friends(String friendsID,String userID) {
		String sql = "select* from friends where friendsID = ? and userID = ? ";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,friendsID);
			pstmt.setString(2, userID);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
	               return 1; 
	            }else if(!rs.next()){
	               return 0; 
	            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int request2Friends(String friendsID,String userID) {
		String sql = "select* from friends where friendsID = ? and userID = ?  ";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2,friendsID);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
	               return 1; 
	            }else if(!rs.next()){
	               return 0; 
	            }
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int requestFriends(String friendsID,String userID,Boolean yNn) {
		String sql = "INSERT into friends values(?,?,false) ";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,friendsID);
			pstmt.setString(2, userID);		
			return pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	public int acceptFriends(String rqID,String myID) {
		String sql = "UPDATE friends SET yNn = 1 WHERE userID = ? and friendsID = ?";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rqID);
			pstmt.setString(2, myID);
			return pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteFriends(String rqID,String myID) {
		String sql = "DELETE FROM friends WHERE userID = ? and friendsID = ?";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rqID);
			pstmt.setString(2, myID);
			return pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int dropFriends(String frID,String frID1, String myID,String myID1) {
		String sql = "DELETE FROM friends WHERE yNn = 1 and (userID = ? or friendsID = ?) and (friendsID = ? or userID = ?)";
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
			conn = Database_Util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, frID);
			pstmt.setString(2, frID1);
			pstmt.setString(3, myID);
			pstmt.setString(4, myID1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	 public ArrayList<Friends> getUserList(String userID) {
    	 String SQL = "select*from friends where yNn = 1 and (userID =? or friendsID = ?) ";
    	 ArrayList<Friends> list = new ArrayList<Friends>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			 pstmt.setString(1, userID);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				Friends Friends = new Friends();
 				Friends.setUserID(rs.getString(1));
 				Friends.setFriendsID(rs.getString(2));
 			
 				
 				list.add(Friends);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     } 
  
	
	


	

	

}
