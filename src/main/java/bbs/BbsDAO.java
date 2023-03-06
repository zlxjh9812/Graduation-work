package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	public BbsDAO() {
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
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
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
	
	
     public int write(String bbsTitle, String userID, String bbsContent, String fileName) {
 		String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?, ?)";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setInt(1, getNext());
 			pstmt.setString(2, bbsTitle);
 			pstmt.setString(3, userID);
 			pstmt.setString(4, getDate());
 			pstmt.setString(5, bbsContent);
 			pstmt.setInt(6, 1);
 			pstmt.setString(7, fileName);
 			return pstmt.executeUpdate();
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return -1; 
     }
     
     public ArrayList<Bbs> getlist() {
    	 String SQL = "SELECT* FROM BBS WHERE bbsAvailable >= 2 ORDER BY bbsID DESC ";
    	 ArrayList<Bbs> list = new ArrayList<Bbs>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				Bbs bbs = new Bbs();
 				bbs.setBbsID(rs.getInt(1));
 				bbs.setBbsTitle(rs.getString(2));
 				bbs.setUserID(rs.getString(3)); 
 				bbs.setBbsDate(rs.getString(4)); 
 				bbs.setBbsContent(rs.getString(5));
 				bbs.setBbsAvailable(rs.getInt(6));
 				bbs.setFileName(rs.getString(7));
 				list.add(bbs);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     }
     public ArrayList<Bbs> getUserContetn(String userID) {
    	 String SQL = "SELECT* FROM BBS WHERE userID = ? ORDER BY bbsID DESC ";
    	 ArrayList<Bbs> list = new ArrayList<Bbs>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			 pstmt.setString(1, userID);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				Bbs bbs = new Bbs();
 				bbs.setBbsID(rs.getInt(1));
 				bbs.setBbsTitle(rs.getString(2));
 				bbs.setUserID(rs.getString(3));
 				bbs.setBbsDate(rs.getString(4)); 
 				bbs.setBbsContent(rs.getString(5));
 				bbs.setBbsAvailable(rs.getInt(6));
 				bbs.setFileName(rs.getString(7));
 				list.add(bbs);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     } 
     public ArrayList<Bbs> getUserContetnDEC(String bbsID) {
    	 String SQL = "SELECT* FROM BBS WHERE bbsID = ?";
    	 ArrayList<Bbs> list = new ArrayList<Bbs>();
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			
 			 pstmt.setString(1, bbsID);
 			rs = pstmt.executeQuery();
 			while(rs.next()) {
 				Bbs bbs = new Bbs();
 				bbs.setBbsID(rs.getInt(1));
 				bbs.setBbsTitle(rs.getString(2));
 				bbs.setUserID(rs.getString(3));
 				bbs.setBbsDate(rs.getString(4)); 
 				bbs.setBbsContent(rs.getString(5));
 				bbs.setBbsAvailable(rs.getInt(6));
 				bbs.setFileName(rs.getString(7));
 				list.add(bbs);
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return list; 
     } 
  

   
     
     public boolean nextpage(int pageNumber) {
    	 String SQL = "SELECT* FROM BBS WHERE bbsID < ? AND bbsAvailable = 1"; 
    	 
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			 pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
 			rs = pstmt.executeQuery();
 			if(rs.next()) {
 			    return true;
 			}
 		}catch(Exception e) {
 			e.printStackTrace();
 		}
 		return false; 
     }
     public Bbs getUserContent(String userID) {
    	 String SQL = "SELECT* FROM BBS WHERE userID = ? ";
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(SQL);
  			 pstmt.setString(1,userID);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				Bbs bbs = new Bbs();
 				bbs.setBbsID(rs.getInt(1));
 				bbs.setBbsTitle(rs.getString(2));
 				bbs.setUserID(rs.getString(3));
 				bbs.setBbsDate(rs.getString(4)); 
 				bbs.setBbsContent(rs.getString(5));
 				bbs.setBbsAvailable(rs.getInt(6));
 				bbs.setFileName(rs.getString(7));
  			    return bbs;
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return null; 
     }
    
     
     public Bbs getBbs(int bbsID) {
    	 String SQL = "SELECT* FROM BBS WHERE bbsID = ? "; 
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(SQL);
  			 pstmt.setInt(1,bbsID);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				Bbs bbs = new Bbs();
 				bbs.setBbsID(rs.getInt(1));
 				bbs.setBbsTitle(rs.getString(2));
 				bbs.setUserID(rs.getString(3));
 				bbs.setBbsDate(rs.getString(4)); 
 				bbs.setBbsContent(rs.getString(5));
 				bbs.setBbsAvailable(rs.getInt(6));
 				bbs.setFileName(rs.getString(7));
  			    return bbs;
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return null; 
     }
     public int update(String bbsTitle, String bbsContent,String fileName,String bbsID) {
    		String SQL = "UPDATE bbs SET bbsTitle=?, bbsContent=?, fileName=?  where bbsID = ?";
    		try {
    			PreparedStatement pstmt = conn.prepareStatement(SQL);
    			pstmt.setString(1, bbsTitle);
    			pstmt.setString(2, bbsContent); 
    			pstmt.setString(3, fileName);
    			pstmt.setString(4, bbsID);
    			return pstmt.executeUpdate();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    		return -1; 
        }
      
      public int delete(String bbsID) {
   		String SQL = "delete from bbs where bbsID = ?";
   		try {
   			PreparedStatement pstmt = conn.prepareStatement(SQL);
   			pstmt.setString(1, bbsID);
   			return pstmt.executeUpdate();
   		}catch(Exception e) {
   			e.printStackTrace();
   		}
   		return -1; 
       }
      public int deleteReportChart(String bbsID) {
     		String SQL = "delete from declarationchart where bbsID = ?";
     		try {
     			PreparedStatement pstmt = conn.prepareStatement(SQL);
     			pstmt.setString(1, bbsID);
     			return pstmt.executeUpdate();
     		}catch(Exception e) {
     			e.printStackTrace();
     		}
     		return -1; 
         }
      public int reportChart(String bbsID) {
    	  String SQL = "update bbs set bbsAvailable = 1 where bbsID = ?";
     		try {
     			PreparedStatement pstmt = conn.prepareStatement(SQL);
     			pstmt.setString(1, bbsID);
     			return pstmt.executeUpdate();
     		}catch(Exception e) {
     			e.printStackTrace();
     		}
     		return -1; 
         }
      public int updateAva(String bbsID) {
    	  String SQL = "update bbs set bbsAvailable = bbsAvailable + 1 where bbsID = ?";
     		try {
     			PreparedStatement pstmt = conn.prepareStatement(SQL);
     			pstmt.setString(1, bbsID);
     			return pstmt.executeUpdate();
     		}catch(Exception e) {
     			e.printStackTrace();
     		}
     		return -1; 
         }
      public ArrayList<Bbs> getUserContetn2(String userID,String findDate) {
     	 String SQL = "SELECT* FROM BBS WHERE userID = ? AND bbsAvailable = 1 AND bbsDATE like ? ORDER BY bbsID DESC ";
     	 ArrayList<Bbs> list = new ArrayList<Bbs>();
  		try {
  			PreparedStatement pstmt = conn.prepareStatement(SQL);
  			
  			 pstmt.setString(1, userID);
  			 pstmt.setString(2, findDate+'%');
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				Bbs bbs = new Bbs();
  				bbs.setBbsID(rs.getInt(1));
  				bbs.setBbsTitle(rs.getString(2));
  				bbs.setUserID(rs.getString(3));
  				bbs.setBbsDate(rs.getString(4)); 
  				bbs.setBbsContent(rs.getString(5));
  				bbs.setBbsAvailable(rs.getInt(6));
  				bbs.setFileName(rs.getString(7));
  				list.add(bbs);
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return list; 
      } 
   
      public ArrayList<Bbs> calendarDot(String userID) {
          String SQL = "SELECT* FROM BBS WHERE userID = ? order by bbsID desc; ";
          ArrayList<Bbs> list = new ArrayList<Bbs>();
         try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            
             pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            while(rs.next()) {
               Bbs bbs = new Bbs();
               bbs.setBbsDate(rs.getString("bbsDate")); 
               bbs.setBbsContent(rs.getString("bbsContent"));
               list.add(bbs);
            }
         }catch(Exception e) {
            e.printStackTrace();
         }
         return list; 
       } 
      

}

