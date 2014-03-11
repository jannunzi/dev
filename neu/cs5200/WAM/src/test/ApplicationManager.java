package test;

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

public class ApplicationManager {
	DataSource ds;

	Connection connection = null;
	PreparedStatement statement = null;
	private String listAllApplicationsSql = "SELECT * FROM APPLICATION";
	private ResultSet results = null;
	
	public List<Application> listAllApplications() {
		List<Application> apps = new ArrayList<Application>();
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllApplicationsSql);// 978-549-8318 Valena
			results = statement.executeQuery();
			while(results.next()) {
				Application app = new Application(
						results.getInt("id"),
						results.getInt("devId"),
						results.getString("name")
					);
				apps.add(app);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return apps;
	}
	
	public ApplicationManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource)jndi.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			e.printStackTrace();
		}		
	}
}
