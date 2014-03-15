package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class ColumnBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllColumns	 = "SELECT * FROM `COLUMN`;";
	String selectColumnsForRow = "SELECT * FROM `COLUMN` WHERE ROWID=?;";
	String deleteColumnForId	 = "DELETE FROM `COLUMN` WHERE ID=?";
	String insertColumn		 = "INSERT INTO `COLUMN` (ID, NAME, ROWID) VALUES (NULL, ?, ?)";
	String updateColumn		 = "UPDATE `COLUMN` SET NAME=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Column> list = null;
	Column column = null;
	
	public boolean create(Column newColumn) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertColumn);
		stmt.setString(1, newColumn.name);
		stmt.setInt(2, newColumn.rowId);
		int columns = stmt.executeUpdate();
		connection.close();
		if(columns > 0)
			return true;
		return false;
	}
	
	public boolean update(Column newColumn) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateColumn);
		stmt.setString(1, newColumn.name);
		stmt.setInt(2, newColumn.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Column> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllColumns);
		results = stmt.executeQuery();
		list = new ArrayList<Column>();
		while(results.next()) {
			column = new Column();
			column.id = results.getInt("id");
			column.name = results.getString("name");
			column.rowId = results.getInt("rowId");
			list.add(column);
		}
		connection.close();
		return list;
	}
	
	public List<Column> readList(int rowId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectColumnsForRow);
		stmt.setInt(1, rowId);
		results = stmt.executeQuery();
		list = new ArrayList<Column>();
		while(results.next()) {
			column = new Column();
			column.id = results.getInt("id");
			column.name = results.getString("name");
			column.rowId = results.getInt("rowId");
			list.add(column);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int rowId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteColumnForId);
		stmt.setInt(1, rowId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public ColumnBean(){
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
