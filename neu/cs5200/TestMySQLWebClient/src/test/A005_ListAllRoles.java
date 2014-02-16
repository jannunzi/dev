package test;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class A005_ListAllRoles {

	public static void main(String[] args) {
		try {
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			
			// @new
			String sql = "SELECT * FROM ROLETYPE";
			Statement stmt = conn.createStatement();
			ResultSet results = stmt.executeQuery(sql);
			while(results.next()){
				String type = results.getString("type");
				System.out.println(type);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
