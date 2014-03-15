package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class RowBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllRows	 = "SELECT * FROM ROW;";
	String selectRowsForPage = "SELECT * FROM ROW WHERE PAGEID=?;";
	String deleteRowForId	 = "DELETE FROM ROW WHERE ID=?";
	String insertRow		 = "INSERT INTO ROW (ID, NAME, PAGEID) VALUES (NULL, ?, ?)";
	String updateRow		 = "UPDATE ROW SET NAME=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Row> list = null;
	Row row = null;
	
	public boolean create(Row newRow) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertRow);
		stmt.setString(1, newRow.name);
		stmt.setInt(2, newRow.pageId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Row newRow) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateRow);
		stmt.setString(1, newRow.name);
		stmt.setInt(2, newRow.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Row> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllRows);
		results = stmt.executeQuery();
		list = new ArrayList<Row>();
		while(results.next()) {
			row = new Row();
			row.id = results.getInt("id");
			row.name = results.getString("name");
			row.pageId = results.getInt("pageId");
			list.add(row);
		}
		connection.close();
		return list;
	}
	
	public List<Row> readList(int rowId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectRowsForPage);
		stmt.setInt(1, rowId);
		results = stmt.executeQuery();
		list = new ArrayList<Row>();
		while(results.next()) {
			row = new Row();
			row.id = results.getInt("id");
			row.name = results.getString("name");
			row.pageId = results.getInt("pageId");
			list.add(row);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int rowId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteRowForId);
		stmt.setInt(1, rowId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public RowBean(){
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
