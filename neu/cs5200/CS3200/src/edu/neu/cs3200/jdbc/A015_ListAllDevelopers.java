package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A015_ListAllDevelopers {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			// @new
			String sql = "SELECT * FROM DEVELOPER";
			Statement statement = connection.createStatement();
			ResultSet results = statement.executeQuery(sql);
			while(results.next()) {
				int id = results.getInt("id");
				String fName = results.getString("firstName");
				String lName = results.getString("lastName");
				System.out.print(id + ", ");
				System.out.print(fName + ", ");
				System.out.println(lName + ", ");
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
