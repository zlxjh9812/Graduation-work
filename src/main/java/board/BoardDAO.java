package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;


public class BoardDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	public BoardDAO() {
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
	
	public int getNext() {
		String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	
	public int boardWrite(String boardUserID, String boardContent, String bbsID) {
 		String SQL = "INSERT INTO board VALUES(?, ?, ?, ?, ?,?);";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setInt(1, getNext()); 
 			pstmt.setString(2, boardUserID);
 			pstmt.setString(3, boardContent);
 			pstmt.setString(4, getDate());
 			pstmt.setString(5,bbsID);
 			pstmt.setInt(6, 1);
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
	
	 public ArrayList<Board> getlist() {
    	 String SQL = "SELECT* FROM board WHERE  ORDER BY boardID ";
    	 ArrayList<Board> list = new ArrayList<Board>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				Board board = new Board();
 				board.setBoardID(rs.getInt(1));
 				board.setBoardUserID(rs.getString(2));
 				board.setBoardContent(rs.getString(3)); 
 				board.setWriteDate(rs.getString(4));
 				board.setBbsID(rs.getString(5)); 
 				list.add(board);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     }
	 
	  public ArrayList<Board> getBoardContent(String bbsid) {
	    	 String SQL = "SELECT* FROM board WHERE bbsID = ?  ORDER BY boardID ";
	    	 ArrayList<Board> list = new ArrayList<Board>();
	 		try {
	 			PreparedStatement pstmt = conn.prepareStatement(SQL);
	 			
	 			 pstmt.setString(1,bbsid );
	 			rs = pstmt.executeQuery();
	 			while(rs.next()) {
	 				Board board = new Board();
	 				board.setBoardID(rs.getInt(1));
	 				board.setBoardUserID(rs.getString(2));
	 				board.setBoardContent(rs.getString(3)); 
	 				board.setWriteDate(rs.getString(4));
	 				board.setBbsID(rs.getString(5)); 
	 				list.add(board);
	 			}
	 		}catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return list; 
	     } 
	  
	  public int boardDelete(String boardID) {
	 		String SQL = "DELETE FROM board where boardID = ?";
	 		try {
	 			PreparedStatement pstmt = conn.prepareStatement(SQL);
	 			pstmt.setString(1, boardID);
	 			return pstmt.executeUpdate();
	 		}catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return -1; 
	     }
	  
	  public int updateAva(String boardID) {
    	  String SQL = "update board set boardAva = boardAva + 1 where boardID = ?";
     		try {
     			PreparedStatement pstmt = conn.prepareStatement(SQL);
     			pstmt.setString(1, boardID);
     			return pstmt.executeUpdate();
     		}catch(Exception e) {
     			e.printStackTrace();
     		}
     		return -1; 
         }
	  public int reportAva(String boardID) {
    	  String SQL = "update board set boardAva = 1 where boardID = ?";
     		try {
     			PreparedStatement pstmt = conn.prepareStatement(SQL);
     			pstmt.setString(1, boardID);
     			return pstmt.executeUpdate();
     		}catch(Exception e) {
     			e.printStackTrace();
     		}
     		return -1; 
         }
	   public int deleteReportBoard(String boardID) {
    		String SQL = "delete from declarationcharttext where boardID = ?";
    		try {
    			PreparedStatement pstmt = conn.prepareStatement(SQL);
    			pstmt.setString(1, boardID);
    			return pstmt.executeUpdate();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    		return -1; 
        }
	  public ArrayList<Board> getBoardContentDEC() {
	    	 String SQL = "SELECT* FROM board WHERE boardAva >= 2  ORDER BY boardID ";
	    	 ArrayList<Board> list = new ArrayList<Board>();
	 		try {
	 			PreparedStatement pstmt = conn.prepareStatement(SQL);
	 			
	 			 
	 			rs = pstmt.executeQuery();
	 			while(rs.next()) {
	 				Board board = new Board();
	 				board.setBoardID(rs.getInt(1));
	 				board.setBoardUserID(rs.getString(2));
	 				board.setBoardContent(rs.getString(3)); 
	 				board.setWriteDate(rs.getString(4));
	 				board.setBbsID(rs.getString(5)); 
	 				list.add(board);
	 			}
	 		}catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return list; 
	     } 
	  
}
