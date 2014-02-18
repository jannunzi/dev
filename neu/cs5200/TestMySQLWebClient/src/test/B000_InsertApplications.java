package test;

import java.sql.*;

import sun.font.CreatedFontTracker;

public class B000_InsertApplications {

	public static void main(String[] args) {

		Connection conn = null;
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String insertApplicationSql = "INSERT INTO APPLICATION VALUES (null, 'Keynote', null);";
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(insertApplicationSql);
			insertApplicationSql = "INSERT INTO APPLICATION VALUES (null, 'Pages', null);";
			stmt.executeUpdate(insertApplicationSql);
			insertApplicationSql = "INSERT INTO APPLICATION VALUES (null, 'Numbers', null);";
			stmt.executeUpdate(insertApplicationSql);
			insertApplicationSql = "INSERT INTO APPLICATION VALUES (null, 'Mail', null);";
			stmt.executeUpdate(insertApplicationSql);
			
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
