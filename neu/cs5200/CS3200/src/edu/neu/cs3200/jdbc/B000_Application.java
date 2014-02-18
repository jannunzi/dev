package edu.neu.cs3200.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class B000_Application {

	String url = "jdbc:mysql://localhost/cs3200";
	String driver = "com.mysql.jdbc.Driver";
	Connection connection;
	PreparedStatement statement;
	String createApplicationSql = "INSERT INTO APPLICATION (NULL, NULL, ?)";
	String deleteApplicationSql = "DELETE APPLICATION WHERE ID=?";
	String listAllApplicationsSql = "SELECT * FROM APPLICATION";
	String findApplicationByIdSql = "SELECT * FROM APPLICATION WHERE ID=?";
	String addApplicationToDeveloperSql = "UPDATE APPLICATION SET developerId=? WHERE id=?";
	String changeApplicationsNameSql = "UPDATE APPLICATION SET name=? WHERE id=?";
	
	public void createApplication(String name) {
		
		try {
			
			connection = getConnection();
			
			statement = connection.prepareStatement(createApplicationSql);
			statement.setString(1, name);
			
			closeConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public void deleteApplication() {
		
	}
	public void listAllApplications() {
		
	}
	public void findApplicationById(int id) {
		
	}
	public void addApplicationToDeveloper(int applicationId, int developerId) {
		
	}
	
	public Connection getConnection() {
		try {
			Class.forName (driver).newInstance();
			connection = DriverManager.getConnection (url, "root", null);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public void closeConnection() {
		try {
			connection.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		
		B000_Application test = new B000_Application();
		test.createApplication("Asteroids");
		
	}

}
