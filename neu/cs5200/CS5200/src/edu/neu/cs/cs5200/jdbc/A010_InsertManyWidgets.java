package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class A010_InsertManyWidgets {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		String createWidgetSql = "INSERT INTO WIDGET VALUES (NULL, 'header', 'This is the header');";
		
		// @new
		String[] names = {"footer", "sidebar", "article"};
		String[] content = {"this is the footer", "this is the sidebar", "this is the article"};
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			statement = connection.createStatement();
			
			// @new
			for(int i=0; i<names.length; i++) {
				createWidgetSql = "INSERT INTO WIDGET VALUES (NULL, '"+names[i]+"', '"+content[i]+"')";
				statement.executeUpdate(createWidgetSql);
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
