package test.forms;

import java.sql.*;
import java.sql.DriverManager;

public class A005_GetConnection {

	public static void main(String[] args) {

		// @new
		Connection conn = getConnection();
		System.out.println(conn);
		closeConnection(conn);
		
	}

	// @new
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			return conn;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
