package test.forms;

import java.sql.*;

public class A010_CreateForm {

	public static void main(String[] args) {
		
		Connection conn = getConnection();
		
		// @new
		long id = createForm(conn, "Login");
		System.out.println("New ID: " + id);

		closeConnection(conn);
		
	}
	
	// @new
	public static long createForm(Connection conn, String name) {
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO FORM VALUES (NULL, ?)";
			stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, name);
			stmt.executeUpdate();
			ResultSet rs = stmt.getGeneratedKeys();
			if(rs.next()) {
				return rs.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStatement(stmt);
		}
		return -1;
	}

	// @new
	public static void closeStatement(Statement stmt) {
		try {
			stmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
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
}
