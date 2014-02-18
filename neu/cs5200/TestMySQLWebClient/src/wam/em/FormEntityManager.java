package wam.em;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import wam.model.*;

public class FormEntityManager {
	String createSql  = "INSERT INTO FORM VALUES (NULL, ?)";
	String readOneSql = "SELECT * FROM FORM WHERE ID=?";
	String readAllSql = "SELECT * FROM FORM";
	String updateSql  = "UPDATE FORM SET NAME=? WHERE ID=?";
	String deleteSql  = "DELETE FROM FORM WHERE ID=?";
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;

	public Form readOne(long id) {
		Form form = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(readOneSql);
			statement.setLong(1, id);
			resultSet = statement.executeQuery();
			if(resultSet.next()) {
				form = new Form();
				form.setId(resultSet.getLong("ID"));
				form.setName(resultSet.getString("NAME"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet(resultSet);
			closeStatement(statement);
			closeConnection(connection);
		}
		return form;
	}
	
	public long create(Form form) {
		long newId = -1;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(createSql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, form.getName());
			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if(resultSet.next()) {
				newId = resultSet.getLong(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			closeStatement(statement);
			closeConnection(connection);
		}
		return newId;
	}
	
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost/wam";
			Class.forName ("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection (url, "root", null);
			return conn;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void closeResultSet(ResultSet rs) {
		try {
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void closeStatement(Statement stmt) {
		try {
			stmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		FormEntityManager em = new FormEntityManager();
		
//		Form f1 = new Form("Forma 2");
	//	em.create(f1);
		
		Form f2 = em.readOne(7);
		System.out.println(f2);
		
	}
}
