package DeclarationChartAction;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;
import util.Database_Util;

public class DeclarationChartDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	public DeclarationChartDAO() {
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

	public int Declaration(String bbsID, String Declaration, String userID) {
 		String SQL = "INSERT INTO declarationchart VALUES(?, ?,?);";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, bbsID); 
 			pstmt.setString(2, Declaration);
 			pstmt.setString(3, userID);
 		
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
	
	public String DeclarationUser(int bbsID) {
		 String myID = null;
	        String userID  = null;
	          String SQL = "SELECT userID FROM declarationchart WHERE bbsID = ?";
	          Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;
	          try {
	             conn = Database_Util.getConnection();
	             pstmt = conn.prepareStatement(SQL);
	             pstmt.setInt(1,bbsID);
	             rs = pstmt.executeQuery();

	                if(rs.next()) {
	                   myID = rs.getString("userID");
	                }

	          }catch(Exception e) {
	             e.printStackTrace();
	          }
	        return myID;
	       }
	 public String getUserDEC(int bbsID) {
    	 String SQL = "SELECT* FROM declarationchart WHERE bbsID = ? ORDER BY bbsID DESC ";
    	 String list = null;
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			 pstmt.setInt(1, bbsID);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				DeclarationChart DeclarationChart = new DeclarationChart();
 				DeclarationChart.setBbsID(rs.getInt(1));
 				DeclarationChart.setDeclaration(rs.getString(2));
 				DeclarationChart.setUserID(rs.getString(3));
 			
 				
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     } 
	
}
