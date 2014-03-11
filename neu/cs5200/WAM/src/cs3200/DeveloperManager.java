package cs3200;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DeveloperManager {
	
	DataSource ds = null;
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet results = null;
	List<Developer> devs = null;
	
	String readAllDevelopersSql = "SELECT * FROM DEVELOPER;";
	
	public void removeByLastName(String lastName) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			while(results.next()) {
				String ln = results.getString("lastName");
				if(ln.equals(lastName)) {
					results.deleteRow();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public void insertDeveloper(Developer dev) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			results.moveToInsertRow();
			results.updateString("firstName", dev.getFirstName());
			results.updateString("lastName", dev.getLastName());
			results.updateFloat("salary", dev.getSalary());
			results.insertRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void giveEveryoneBonus(float bonus) {
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllDevelopersSql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			results = statement.executeQuery();
			
			while(results.next()) {
				float oldSalary = results.getFloat("salary");
				float newSalary = oldSalary + bonus;
				results.updateFloat("salary", newSalary);
				results.updateRow();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public List<Developer> readDevelopersReverse() {
		devs = new ArrayList<Developer>();

		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllDevelopersSql, ResultSet.CONCUR_UPDATABLE, ResultSet.TYPE_SCROLL_INSENSITIVE);
			results = statement.executeQuery();
			results.afterLast();
			while(results.previous()){
				Developer dev = new Developer();
				dev.setId(results.getInt("id"));
				dev.setFirstName(results.getString("firstName"));
				dev.setLastName(results.getString("lastName"));
				dev.setSalary(results.getFloat("salary"));
				devs.add(dev);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return devs;
	}
	
	public List<Developer> readAllDevelopers() {
		List<Developer> devs = new ArrayList<Developer>();
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllDevelopersSql);
			results = statement.executeQuery();
			while(results.next()) {
				Developer dev = new Developer();
				dev.setId(results.getInt("id"));
				dev.setFirstName(results.getString("firstName"));
				dev.setLastName(results.getString("lastName"));
				dev.setSalary(results.getFloat("salary"));
				devs.add(dev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return devs;
	}
	
	public DeveloperManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
