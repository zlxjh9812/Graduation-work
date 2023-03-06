package util;

import java.sql.Connection;
import java.sql.ConnectionBuilder;
import java.sql.DriverManager;

public class Database_Util {

	public static Connection getConnection() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/TUTOREAL";
			String dbID = "root";
			String dbPassword="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
