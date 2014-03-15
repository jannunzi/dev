package cs5200;

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

public class UserManager {

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet results = null;
	
	String selectAllUsersSql = "SELECT * FROM USER;";
	String validateUserSql = "SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=?;";
	
	public User validateUser(User user) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(validateUserSql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			results = statement.executeQuery();
			if(results.next()) {
				user = new User(results.getString("username"), results.getString("password"));
				return user;
			}
		} catch (SQLException e) {
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
	
	public List<User> selectAllUsers() {
		List<User> users = new ArrayList<User>();
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(selectAllUsersSql);
			results = statement.executeQuery();
			while(results.next()) {
				User user = new User(
						results.getString("username"),
						results.getString("password")
						);
				users.add(user);
			}
		} catch (SQLException e) {
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
		
		return users;
	}
	
	DataSource ds;
	public UserManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/movies");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
}
