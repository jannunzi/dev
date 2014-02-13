package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestMSSQLConnection {

	public static void main(String[] args) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionUrl = "jdbc:sqlserver://localhost:1433;";
//			String connectionUrl = "jdbc:sqlserver://localhost:1433;" +
	//				   "databaseName=AdventureWorks;user=MyUserName;password=*****;";
			Connection con = DriverManager.getConnection(connectionUrl);
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
