package test;

import java.sql.*;
import java.sql.DriverManager;

public class A025_DeleteOneDeveloper {

	public static void main(String[] args) {
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String deleteOneDeveloper = "DELETE FROM DEVELOPER WHERE ID=6";
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(deleteOneDeveloper);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
