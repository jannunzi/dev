package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class A015_InsertManyWidgetsWithPreparedStatements {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		// @new
		String createWidgetSql = "INSERT INTO WIDGET VALUES (NULL, ?, ?);";
		
		// @new
		String[] names = {"maincontent", "section", "title"};
		String[] content = {"this is the main content", "this is the section", "this is the title"};
		
		Connection connection = null;
		Statement statement = null;
		
		// @new
		PreparedStatement pstatement = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			pstatement = connection.prepareStatement(createWidgetSql);
			
			// @new
			for(int i=0; i<names.length; i++) {
				pstatement.setString(1, names[i]);
				pstatement.setString(2, content[i]);
				pstatement.executeUpdate();
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
