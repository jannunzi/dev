package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class A005_InsertDeveloper {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);

			// @new
			String sql = "INSERT INTO DEVELOPER VALUES (NULL, 'Alice', 'Wonderland')";
			Statement statement = connection.createStatement();
			int rowsAffected = statement.executeUpdate(sql);
			System.out.println("Rows Affected: " + rowsAffected);
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
