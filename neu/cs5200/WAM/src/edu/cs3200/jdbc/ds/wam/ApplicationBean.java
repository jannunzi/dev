package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class ApplicationBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllApplications	 = "SELECT * FROM APPLICATION;";
	String selectApplicationsForDev	 = "SELECT * FROM APPLICATION WHERE DEVID=?;";
	String deleteApplicationForId	 = "DELETE FROM APPLICATION WHERE ID=?";
	String insertApplication		 = "INSERT INTO APPLICATION VALUES (NULL, NULL, ?)";
	String updateApplication		 = "UPDATE APPLICATION SET NAME=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Application> list = null;
	Application application = null;
	
	public boolean create(Application newApplication) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertApplication);
		stmt.setString(1, newApplication.name);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Application newApplication) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateApplication);
		stmt.setString(1, newApplication.name);
		stmt.setInt(2, newApplication.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Application> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllApplications);
		results = stmt.executeQuery();
		list = new ArrayList<Application>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			application = new Application(id, name);
			list.add(application);
		}
		connection.close();
		return list;
	}
	
	public List<Application> readList(int devId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectApplicationsForDev);
		stmt.setInt(1, devId);
		results = stmt.executeQuery();
		list = new ArrayList<Application>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			application = new Application(id, name);
			list.add(application);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int applicationId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteApplicationForId);
		stmt.setInt(1, applicationId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public ApplicationBean(){
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
