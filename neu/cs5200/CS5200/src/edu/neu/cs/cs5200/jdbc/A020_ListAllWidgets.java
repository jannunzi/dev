package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class A020_ListAllWidgets {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		//@new
		int id;
		String name, content;
		
		// @new
		String readAllWidgets = "SELECT * FROM WIDGET";
		
		Connection connection = null;
		PreparedStatement pstatement = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			// @new
			pstatement = connection.prepareStatement(readAllWidgets);
			ResultSet results = pstatement.executeQuery();
			while(results.next()) {
				id = results.getInt("id");
				name = results.getString("name");
				content = results.getString("content");
				System.out.println(id + " " + name + " " + content);
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
