package movies;

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
	String validateUsersSql  = "SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=?;";
	String createUser = "INSERT INTO USER (USERNAME, PASSWORD, FIRSTNAME, LASTNAME) VALUES (?,?,?,?);";

	public User validateUser(User user) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(validateUsersSql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			results = statement.executeQuery();
			if(results.next()) {
				user = new User(
						results.getString("username"),
						results.getString("password"),
						results.getString("firstName"),
						results.getString("lastName"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	public boolean createUser(User newUser) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(createUser);
			statement.setString(1, newUser.getUsername());
			statement.setString(2, newUser.getPassword());
			statement.setString(3, newUser.getFirstName());
			statement.setString(4, newUser.getLastName());
			statement.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
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
						results.getString("password"),
						results.getString("firstName"),
						results.getString("lastName"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	DataSource ds;
	public UserManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/movies1");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
