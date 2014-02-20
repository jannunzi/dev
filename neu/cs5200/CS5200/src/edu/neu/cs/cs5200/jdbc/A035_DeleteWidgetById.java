package edu.neu.cs.cs5200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class A035_DeleteWidgetById {

	public static void main(String[] args) {
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost/cs5200";
		
		Connection connection = null;
		PreparedStatement pstatement = null;
		
		// @new
		String deleteWidgetSql = "DELETE FROM WIDGET WHERE ID=?";
		
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
			
			// @new
			pstatement = connection.prepareStatement(deleteWidgetSql);
			pstatement.setInt(1, 8);
			int ra = pstatement.executeUpdate();
			System.out.println(ra);
			
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
