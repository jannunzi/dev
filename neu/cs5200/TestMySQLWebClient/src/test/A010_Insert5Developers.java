package test;

import java.sql.*;

import sun.font.CreatedFontTracker;

public class A010_Insert5Developers {

	public static void main(String[] args) {
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String insertDeveloperSql = "INSERT INTO DEVELOPER VALUES (null, 'Alice', 'Wonderland');";
			Statement inserStatementStmt = conn.createStatement();
			inserStatementStmt.executeUpdate(insertDeveloperSql);
			insertDeveloperSql = "INSERT INTO DEVELOPER VALUES (null, 'Bob', 'Marley');";
			inserStatementStmt.executeUpdate(insertDeveloperSql);
			insertDeveloperSql = "INSERT INTO DEVELOPER VALUES (null, 'Charlie', 'Garcia');";
			inserStatementStmt.executeUpdate(insertDeveloperSql);
			insertDeveloperSql = "INSERT INTO DEVELOPER VALUES (null, 'Daniel', 'Boone');";
			inserStatementStmt.executeUpdate(insertDeveloperSql);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
