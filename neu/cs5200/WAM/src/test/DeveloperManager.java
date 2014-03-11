package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DeveloperManager {

	private DataSource ds;

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet results = null;
			
	String listAllDevelopersSql = "SELECT * FROM DEVELOPER;";
	
	public void deleteWithResultSet(String lastName) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			while(results.next()) {
				String lName = results.getString("lastName");
				if(lName.equals(lastName)) {
					results.deleteRow();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void insertWhileSelecting(Developer developer) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			results.moveToInsertRow();
			results.updateString("firstName", developer.getFirstName());
			results.updateString("lastName", developer.getLastName());
			results.updateFloat("salary", developer.getSalary());
			results.insertRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Developer> giveRaiseToEveryone(float amount) {
		List<Developer> developers = new ArrayList<Developer>();
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			while(results.next()) {
				float oldSalary = results.getFloat("salary");
				float newSalary = oldSalary + amount;
				results.updateFloat("salary", newSalary);
				results.updateRow();
				Developer developer = new Developer(results.getInt("id"), results.getString("firstName"), results.getString("lastName"), results.getFloat("salary"));
				developers.add(developer);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch(SQLException ee) {
				ee.printStackTrace();
			}
		}
		return developers;
	}
	
	public List<Developer> listAllDevelopersReverse() {
		List<Developer> developers = new ArrayList<Developer>();
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllDevelopersSql);
			results = statement.executeQuery();
			results.afterLast();
			while(results.previous()) {
				Developer developer = new Developer(results.getInt("id"), results.getString("firstName"), results.getString("lastName"), results.getFloat("salary"));
				developers.add(developer);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch(SQLException ee) {
				ee.printStackTrace();
			}
		}
		return developers;
	}
	
	public List<Developer> listAllDevelopers() {
		List<Developer> developers = new ArrayList<Developer>();
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllDevelopersSql);
			results = statement.executeQuery();
			while(results.next()) {
				Developer developer = new Developer(results.getInt("id"), results.getString("firstName"), results.getString("lastName"), results.getFloat("salary"));
				developers.add(developer);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch(SQLException ee) {
				ee.printStackTrace();
			}
		}
		return developers;
	}
	
	public DeveloperManager() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws SQLException {
		DeveloperManager mgr = new DeveloperManager();
		List<Developer> devs = mgr.listAllDevelopers();
		for(Developer dev : devs) {
			System.out.println(dev);
		}
	}

}
