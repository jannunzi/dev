package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.PreparedStatement;

public class A030_UpdateWidget {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		// @new
		String updateWidgetSql = "UPDATE WIDGET SET content='This is my new content' WHERE ID=?";
		PreparedStatement pstatement = null;
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			// @new
			pstatement = connection.prepareStatement(updateWidgetSql);
			pstatement.setInt(1, 8);
			int rowsAffected = pstatement.executeUpdate();
			System.out.println("Rows Affected: " + rowsAffected);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
