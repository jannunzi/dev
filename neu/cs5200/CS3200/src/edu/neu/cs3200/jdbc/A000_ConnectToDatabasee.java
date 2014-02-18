package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class A000_ConnectToDatabasee {

	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost/cs3200";
		String driver = "com.mysql.jdbc.Driver";
		
		Connection connection = null;
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			System.out.println(connection);
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
