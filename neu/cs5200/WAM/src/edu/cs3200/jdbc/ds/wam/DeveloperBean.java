package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class DeveloperBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String firstName;
	String lastName;
	float  salary;

	String selectAllDevelopers	 = "SELECT * FROM DEVELOPER;";
	String deleteDeveloperForId	 = "DELETE FROM DEVELOPER WHERE ID=?";
	String insertDeveloper		 = "INSERT INTO DEVELOPER VALUES (NULL, ?, ?, ?)";
	String updateDeveloper		 = "UPDATE DEVELOPER SET FIRSTNAME=?, LASTNAME=?, SALARY=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Developer> list = null;
	Developer developer = null;
	
	public boolean create(Developer newDeveloper) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertDeveloper);
		stmt.setString(1, newDeveloper.firstName);
		stmt.setString(2, newDeveloper.lastName);
		stmt.setFloat(3, newDeveloper.salary);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Developer newDeveloper) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateDeveloper);
		stmt.setString(1, newDeveloper.firstName);
		stmt.setString(2, newDeveloper.lastName);
		stmt.setFloat(3, newDeveloper.salary);
		stmt.setInt(4, newDeveloper.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Developer> readList() throws SQLException{ 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllDevelopers);
		results = stmt.executeQuery();
		list = new ArrayList<Developer>();
		while(results.next()) {
			id = results.getInt("id");
			firstName = results.getString("firstName");
			lastName = results.getString("lastName");
			salary = results.getFloat("salary");
			developer = new Developer(id, firstName, lastName, salary);
			list.add(developer);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int developerId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteDeveloperForId);
		stmt.setInt(1, developerId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public DeveloperBean(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
