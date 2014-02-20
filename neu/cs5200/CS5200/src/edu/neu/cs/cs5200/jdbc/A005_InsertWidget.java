package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class A005_InsertWidget {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		// @new
		String createWidgetSql = "INSERT INTO WIDGET VALUES (NULL, 'header', 'This is the header');";
		
		Connection connection = null;
		
		// @new
		Statement statement = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			// @new
			statement = connection.createStatement();
			statement.executeUpdate(createWidgetSql);
			
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
