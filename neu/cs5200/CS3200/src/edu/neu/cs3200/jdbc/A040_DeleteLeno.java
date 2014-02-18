package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A040_DeleteLeno {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);

			// @new
			String sql = "DELETE FROM DEVELOPER WHERE FIRSTNAME=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, "Jay");
			int rowsAffected = statement.executeUpdate();
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
