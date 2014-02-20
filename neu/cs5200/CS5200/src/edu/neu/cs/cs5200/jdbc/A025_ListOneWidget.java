package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class A025_ListOneWidget {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		int id;
		String name, content;
		
		String readAllWidgetsSql = "SELECT * FROM WIDGET";
		
		// @new
		String readOneWidgetSql = "SELECT * FROM WIDGET WHERE ID=3";
		
		Connection connection = null;
		PreparedStatement pstatement = null;
		ResultSet results = null;
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			pstatement = connection.prepareStatement(readAllWidgetsSql);
			results = pstatement.executeQuery();
			while(results.next()) {
				id = results.getInt("id");
				name = results.getString("name");
				content = results.getString("content");
				System.out.println(id + " " + name + " " + content);
			}
			
			System.out.println("====================");
			
			// @new
			pstatement = connection.prepareStatement(readOneWidgetSql);
			results = pstatement.executeQuery();
			if(results.next()) {
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
