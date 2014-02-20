package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A017_InsertOneWidgetsGetGeneratedId {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		String createOneWidgetSql = "INSERT INTO WIDGET VALUES (NULL, ?, ?);";
		
		Connection connection = null;
		Statement statement = null;
		PreparedStatement pstatement = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			pstatement = connection.prepareStatement(createOneWidgetSql, Statement.RETURN_GENERATED_KEYS);
			
			pstatement.setString(1, "secondsection");
			pstatement.setString(2, "This is the second section");
			pstatement.executeUpdate();
			
			// @new
			ResultSet key = pstatement.getGeneratedKeys();
			if(key.next()) {
				long generatedId = key.getLong(1);
				System.out.println(generatedId);
			}
			
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
