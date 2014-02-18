package test;

import java.sql.*;

public class A025_DeleteOneDeveloper {

	public static void main(String[] args) {

		Connection conn = null;
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String deleteOneDeveloper = "DELETE FROM DEVELOPER WHERE ID=6";
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(deleteOneDeveloper);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
