package com.atc.siterra.bup;

import java.sql.*;

public class Test {
	
	public String hello()
	{
		return "Hello";
	}
	
	public String test()
	{
		Connection connection = null;
		try {
			Driver d = (Driver)Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
			connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://QCSMN01:1433;databaseName=ShareGen", "semaan_app_user", "qcdb01");
			System.out.println(connection);
			String testSql = "select * from ShareGenMain";
			PreparedStatement statement = connection.prepareStatement(testSql);
			ResultSet results = statement.executeQuery();
			while(results.next())
			{
				String towerNumber = results.getString("TowerNumber");
				String siteName = results.getString("SiteName");
				System.out.println(towerNumber + " " + siteName);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public static void main(String[] args) {
	}
}
