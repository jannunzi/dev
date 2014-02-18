package test.forms;

import java.sql.*;

public class A020_GetOneForm {

	public static void main(String[] args) {
		
		Connection conn = getConnection();
		
		listAllForms(conn);
		
		// @new
		getOneForm(conn, 2);
		
		closeConnection(conn);
		
	}

	// @new
	public static void getOneForm(Connection conn, int id) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM FORM WHERE ID=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				System.out.println(id + " " + name);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet(rs);
			closeStatement(stmt);
			closeConnection(conn);
		}
	}
	
	public static void listAllForms(Connection conn) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM FORM";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			printResultSet(rs);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeResultSet(rs);
			closeStatement(stmt);
		}
	}
	
	public static void printResultSet(ResultSet rs) {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
			while(rs.next()) {
				for(int c=1; c<=colCount; c++) {
					String colName = rsmd.getColumnName(c);
					Object value = rs.getObject(c);
					System.out.print(value + ", ");
				}
				System.out.println();
			}			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet(rs);
		}
	}
	
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
