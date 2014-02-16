package test;

import java.sql.*;
import java.sql.DriverManager;

public class A015_ListAllDevelopers {

	public static void main(String[] args) {
		try {
			
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);

			// @new
			String selectAllDevelopers = "SELECT * FROM DEVELOPER";
			Statement stmt = conn.createStatement();
			ResultSet results = stmt.executeQuery(selectAllDevelopers);
			while(results.next()){
				int id = results.getInt("id");
				String firstName = results.getString("firstName");
				String lastName = results.getString("lastName");
				System.out.print(id + " ");
				System.out.print(firstName + " ");
				System.out.println(lastName);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
