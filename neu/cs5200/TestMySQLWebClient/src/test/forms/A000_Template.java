package test.forms;

import java.sql.*;
import java.sql.DriverManager;

public class A000_Template {

	public static void main(String[] args) {
		try {
			
			// @new
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			System.out.println(conn);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
