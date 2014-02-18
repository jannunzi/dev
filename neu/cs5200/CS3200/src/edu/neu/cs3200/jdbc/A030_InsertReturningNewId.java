package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A030_InsertReturningNewId {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);

			// @new
			String sql = "INSERT INTO DEVELOPER VALUES (NULL, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, "Jay");
			statement.setString(2, "Leno");
			statement.executeUpdate();
			ResultSet ids = statement.getGeneratedKeys();
			if(ids.next()) {
				long newId = ids.getLong(1);
				System.out.println(newId);
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
