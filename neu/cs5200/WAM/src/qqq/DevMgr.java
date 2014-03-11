package qqq;

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

public class DevMgr {
	
	DataSource ds = null;
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet results = null;
	
	String readAllSql = "SELECT * FROM DEVELOPER;";
	
	public List<Developer> readAll() {
		List<Developer> devs = new ArrayList<Developer>();
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllSql);
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
		}
		
		return devs;
	}
	
	public DevMgr() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
