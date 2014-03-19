package cs3200;

import java.sql.*;
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
	
	String createUserSql = "INSERT INTO USER (USERNAME, PASSWORD) VALUES (?, ?);";
	String readUser = "SELECT * FROM USER WHERE USERNAME=?;";
	String readAllUsersSql = "SELECT * FROM USER;";
	String updateUserSql = "UPDATE USER SET PASSWORD=? WHERE USERNAME=?;";
	String deleteUserSql = "DELETE FROM USER WHERE USERNAME=?";
	
	public void deleteUser(String username) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(deleteUserSql);
			statement.setString(1, username);
			statement.executeUpdate();
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
	}
	
	public void createUser(User user) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(createUserSql);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.executeUpdate();
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
	}
	
	public List<User> readAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readAllUsersSql);
			results = statement.executeQuery();
			while(results.next()) {
				User user = new User(results.getString("username"), results.getString("password"));
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
	
	public User readUser(String username) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(readUser);
			statement.setString(1, username);
			results = statement.executeQuery();
			if(results.next()) {
				User user = new User(results.getString("username"), results.getString("password"));
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
	
	public void updateUser(String username, User user) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(updateUserSql);
			statement.setString(1, user.getPassword());
			statement.setString(2, username);
			statement.executeUpdate();
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
	}
	
	DataSource ds;
	public UserManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/books");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
