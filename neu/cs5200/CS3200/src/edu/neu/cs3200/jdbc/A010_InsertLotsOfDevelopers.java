package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class A010_InsertLotsOfDevelopers {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		// @new
		String[] fNames = {"Bob", "Charly", "Dan", "Edward"};
		String[] lNames = {"Marley", "Garcia", "Boon", "Norton"};
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);

			// @new
			Statement statement = connection.createStatement();
			String sql = null;
			for(int i=0; i<fNames.length; i++) {
				sql = "INSERT INTO DEVELOPER VALUES (NULL, '"+fNames[i]+"', '"+lNames[i]+"')";
				int rowsAffected = statement.executeUpdate(sql);
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
