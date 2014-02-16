package test;

import java.sql.*;

import sun.font.CreatedFontTracker;

public class C000_AddAppsToDeveloper {

	public static void main(String[] args) {
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String addApplicationToAliceSql = "UPDATE APPLICATION SET DEVELOPERID=2 WHERE ID=1 ;";
			Statement stmt = conn.createStatement();
			int rowsAffected = stmt.executeUpdate(addApplicationToAliceSql);
			System.out.println("Rows Affected: " + rowsAffected);
			addApplicationToAliceSql = "UPDATE APPLICATION SET DEVELOPERID=2 WHERE ID=2 ;";
			rowsAffected = stmt.executeUpdate(addApplicationToAliceSql);
			System.out.println("Rows Affected: " + rowsAffected);
			addApplicationToAliceSql = "UPDATE APPLICATION SET DEVELOPERID=3 WHERE ID=3 ;";
			rowsAffected = stmt.executeUpdate(addApplicationToAliceSql);
			System.out.println("Rows Affected: " + rowsAffected);
			addApplicationToAliceSql = "UPDATE APPLICATION SET DEVELOPERID=3 WHERE ID=4 ;";
			rowsAffected = stmt.executeUpdate(addApplicationToAliceSql);
			System.out.println("Rows Affected: " + rowsAffected);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
