package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.Database_Util;

public class User_DAO {
   
	private Connection conn;
	private ResultSet rs;
	
	public User_DAO() {
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

public int login(String userID,String userPassWord) {
      String SQL = "SELECT userPassWord FROM USER WHERE userID = ?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String root = "ROOT";
      try {
         conn = Database_Util.getConnection();
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1,userID);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            if(rs.getString(1).equals(userPassWord)) {
               return 1; 
            }else if(rs.getString(1).equals(root)){
               return 2; 
            }else{
            	return 0;
            }
         }
         return -1; 
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
         try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
         try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
         }
      return -2; 
   }
   
public int join(String userID, String userPassWord,String userPassWord2 ,String firstName, String Name, String userEmail,
		String userEmailHash, Boolean userEmailchecked,String userPic,String Usercalendar) {
	String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?, false, ?,?)";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {  
       conn = Database_Util.getConnection();
       pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1,userID);
      pstmt.setString(2,userPassWord);
      pstmt.setString(3,userPassWord2);
      pstmt.setString(4,firstName);
      pstmt.setString(5,Name);
      pstmt.setString(6,userEmail);
     
      pstmt.setString(7, userEmailHash);
      pstmt.setString(8,userPic);
      pstmt.setString(9,Usercalendar);
      
      
      if(userPassWord.equals(userPassWord2)) {
			return pstmt.executeUpdate();
			
		}else {
			return 0;//?????????????????? ???????????????
		}
      
    }catch(Exception e) {
  	  e.printStackTrace();
    }finally{
  	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
        try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
        try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
    }
	return -1;//???????????????????????? ????????????
    
 }
   
   public String getUserEmail(String userID) { //?????? ??????????????????????????? ???????????????????????? ID????????? ????????? ?????? ???????????????????????? ??????????????? ??????????????? ??????????????????????????? ?????????????? ???????????????(???????????????)

		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			conn = Database_Util.getConnection(); // ????????????????????????????????? ??????????????? ?????????????????? ???????????????
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // ??????????????? ???????????? ????????? ????????????

			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return null; // ????????????
		}
   public String getUserEmailID(String userEmail) { //?????? ??????????????????????????? ???????????????????????? ID????????? ????????? ?????? ???????????????????????? ??????????????? ??????????????? ??????????????????????????? ?????????????? ???????????????(???????????????)

		String SQL = "SELECT userEmail FROM USER WHERE userEmail = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			conn = Database_Util.getConnection(); // ????????????????????????????????? ??????????????? ?????????????????? ???????????????
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userEmail);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // ??????????????? ???????????? ????????? ????????????

			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return null; // ????????????
		}
		public String getUserEmail2(String userEmail) { //?????? ??????????????????????????? ???????????????????????? ID????????? ????????? ?????? ???????????????????????? ??????????????? ??????????????? ??????????????????????????? ?????????????? ???????????????(???????????????)

			String SQL = "SELECT userEmail FROM USER WHERE userEmail = ?";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {

				conn = Database_Util.getConnection(); // ????????????????????????????????? ??????????????? ?????????????????? ???????????????
				pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userEmail);

				rs = pstmt.executeQuery();
				if (rs.next()) {

					return rs.getString(1);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally { // ??????????????? ???????????? ????????? ????????????

				try {
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (rs != null)
						rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			return null; // ????????????

		
		
		
	}
   public boolean getUserEmailChecked(String userID) {
	      String SQL = "SELECT userEmailChecked FROM user WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	      conn = Database_Util.getConnection();
	        pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1,userID);
	         rs = pstmt.executeQuery();
	         return rs.getBoolean(1);
	      }catch(Exception e) {
	    	  e.printStackTrace();
	      }finally{
	    	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
	      }
		return false;//????????????????????????????????? ????????????
	      
	   }
   
   public boolean setUserEmailChecked(String userID) {
	      String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID =?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	      conn = Database_Util.getConnection();
	        pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1,userID);
	         pstmt.executeUpdate();
	         return true;
	      
	      }catch(Exception e) {
	    	  e.printStackTrace();
	      }finally{
	    	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
	      }
		return false;//????????????????????????????????? ????????????
	      
	   }

   public boolean UserEmailChecked(String userID) {
	      String SQL = "SELECT userEmailChecked FROM user WHERE userID=?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	      conn = Database_Util.getConnection();
	        pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1,userID);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 return rs.getBoolean(1);
	         }
	      }catch(Exception e) {
	    	  e.printStackTrace();
	      }finally{
	    	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
	          try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
	      }
		return false;//????????????????????????????????? ????????????
	      
	   }
 

   public int IDCheck(String userID) {
       String SQL = "SELECT userID FROM USER WHERE userID = ?";
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       try {
           conn = Database_Util.getConnection();
           pstmt = conn.prepareStatement(SQL);
           pstmt.setString(1,userID);
           rs = pstmt.executeQuery();
           if(rs.next()) {
               if(rs.getString(1).equals(userID)) {
                   return 1; //?????????????????? ?????????
               }
           }
           return 0; //?????????????????? ????????????
       }catch(Exception e) {
           e.printStackTrace();
       }finally {
           try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
           try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
           try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
           }
       return -1; //????????????????????????????????? ????????????
   }
   
   public String FindIdAction(String userEmail) {
		String SQL = "SELECT userID From USER WHERE userEmail =?";
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     String user_ID = null;

	     try {
	    	 pstmt = conn.prepareStatement(SQL);
	    	 pstmt.setString(1,userEmail);
	    	 rs = pstmt.executeQuery();
	    	if( rs.next()){  //rs?????? ??????????????????????????? ?????????
	    		user_ID=rs.getString("user_ID"); 
	    		   }
	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }finally {
	           try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
	           try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
	           try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
	           }
	     return user_ID;
	}
   public int ResetPWID(String userID) {
	      String SQL = "SELECT userID FROM USER WHERE userID = ?";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = Database_Util.getConnection();
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1,userID);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            if(rs.getString(1).equals(userID)) {
	               return 1; //??????????????? ????????????
	            }else {
	               return 0; //??????????????? ????????????
	            }
	         }
	         return -1; //?????????????????? ????????????
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
	         try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
	         try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
	         }
	      return -2; //????????????????????????????????? ????????????
	   }public int ResetPWEmail(String userEmail) {
		      String SQL = "SELECT userEmail FROM USER WHERE userEmail = ?";
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         conn = Database_Util.getConnection();
		         pstmt = conn.prepareStatement(SQL);
		         pstmt.setString(1,userEmail);
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		            if(rs.getString(1).equals(userEmail)) {
		               return 1; //??????????????? ????????????
		            }else {
		               return 0; //??????????????? ????????????
		            }
		         }
		         return -1; //?????????????????? ????????????
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
		         try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
		         try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
		         }
		      return -2; //????????????????????????????????? ????????????
		   }
	   
	   public int ResetPassWord(String userPassWord,String userPassWord2,String userID) {
			String SQL = "UPDATE USER set userPassWord=?, userPassWord2=? WHERE userID=?";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    try {  
		       conn = Database_Util.getConnection();
		       pstmt = conn.prepareStatement(SQL);
		     
		      pstmt.setString(1,userPassWord);
		      pstmt.setString(2,userPassWord2);
		      pstmt.setString(3,userID);
		      
		      
		      if(userPassWord.equals(userPassWord2)) {
					return pstmt.executeUpdate();
					
				}else {
					return 0;//?????????????????? ???????????????
				}
		      
		    }catch(Exception e) {
		  	  e.printStackTrace();
		    }finally{
		  	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
		        try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
		        try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
		    }
			return -1;//???????????????????????? ????????????
		    
		 }
	   public String FindId(String userEmail) {
		        String myID = null;
		        
		          String SQL = "SELECT userID FROM USER WHERE userEmail = ?";
		          Connection conn = null;
		          PreparedStatement pstmt = null;
		          ResultSet rs = null;
		          try {
		             conn = Database_Util.getConnection();
		             pstmt = conn.prepareStatement(SQL);
		             pstmt.setString(1,userEmail);
		             rs = pstmt.executeQuery();

		                if(rs.next()) {
		                   myID = rs.getString("userID");
		                }

		          }catch(Exception e) {
		             e.printStackTrace();
		          }
		        return myID;
		       }
	   public int updateUserPic(String userID,String userPic) {
			String SQL = "UPDATE USER set userPic=?WHERE userID=?";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    try {  
		       conn = Database_Util.getConnection();
		       pstmt = conn.prepareStatement(SQL);
		     
		      pstmt.setString(2,userID);
		      pstmt.setString(1,userPic);
		     
		      
		      
		    
					return pstmt.executeUpdate();
					
				
					
			
		      
		    }catch(Exception e) {
		  	  e.printStackTrace();
		    }finally{
		  	  try{if(conn != null)   conn.close();} catch (Exception e) {e.printStackTrace();}
		        try{if(pstmt != null)   pstmt.close();} catch (Exception e) {e.printStackTrace();}
		        try{if(rs != null)   rs.close();} catch (Exception e) {e.printStackTrace();}
		    }
			return -1;//???????????????????????? ????????????
		    
		 }
	   
	   public String profile(String userID) {
			String SQL = "SELECT userPic FROM USER WHERE userID = ?";
			String propic = null;
	 		try {
	 			PreparedStatement pstmt = conn.prepareStatement(SQL);
	 			pstmt.setString(1, userID);
	 			rs=pstmt.executeQuery();
	 			if(rs.next()) {
	 				propic= rs.getString("userPic");
	 			}
	 			
	 		}catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return propic; 
		}
	   public int updateUserCalendar(String Usercalendar ,String userID) {
	    	  String SQL = "UPDATE USER set Usercalendar=? WHERE userID= ?";
	     		try {
	     			PreparedStatement pstmt = conn.prepareStatement(SQL);
	     			pstmt.setString(1, Usercalendar);
	     			pstmt.setString(2, userID);
	     			return pstmt.executeUpdate();
	     		}catch(Exception e) {
	     			e.printStackTrace();
	     		}
	     		return -1; 
	     		
	         }
	   public String UserCalendar(String userID) {
			String SQL = "select Usercalendar from USER where userID = ?;";
			String propic = null;
	 		try {
	 			PreparedStatement pstmt = conn.prepareStatement(SQL);
	 			pstmt.setString(1, userID);
	 			rs=pstmt.executeQuery();
	 			if(rs.next()) {
	 				propic=rs.getString("Usercalendar"); 
	 			}
	 			
	 		}catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return propic; 
		}
}

	


