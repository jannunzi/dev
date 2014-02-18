package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class A025_InsertWithPreparedStatements {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		// @new
		String[] fNames = {"Frank", "Gregory", "Herbert"};
		String[] lNames = {"Herbert", "Peck", "Humphrey"};
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);

			// @new
			String sql = "INSERT INTO DEVELOPER VALUES (NULL, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			for(int i=0; i<fNames.length; i++) {
				statement.setString(1, fNames[i]);
				statement.setString(2, lNames[i]);
				int rowsAffected = statement.executeUpdate();
				System.out.println("Rows Affected: " + rowsAffected);
			}
		
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
