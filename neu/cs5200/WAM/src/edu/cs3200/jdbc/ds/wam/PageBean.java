package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class PageBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllPages	 = "SELECT * FROM PAGE;";
	String selectPagesForApp = "SELECT * FROM PAGE WHERE APPID=?;";
	String deletePageForId	 = "DELETE FROM PAGE WHERE ID=?";
	String insertPage		 = "INSERT INTO PAGE VALUES (NULL, ?, NULL)";
	String updatePage		 = "UPDATE PAGE SET NAME=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Page> list = null;
	Page page = null;
	
	public boolean create(Page newPage) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertPage);
		stmt.setString(1, newPage.name);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Page newPage) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updatePage);
		stmt.setString(1, newPage.name);
		stmt.setInt(2, newPage.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Page> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllPages);
		results = stmt.executeQuery();
		list = new ArrayList<Page>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			page = new Page(id, name);
			list.add(page);
		}
		connection.close();
		return list;
	}
	
	public List<Page> readList(int appId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectPagesForApp);
		stmt.setInt(1, appId);
		results = stmt.executeQuery();
		list = new ArrayList<Page>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			page = new Page(id, name);
			list.add(page);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int pageId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deletePageForId);
		stmt.setInt(1, pageId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public PageBean(){
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
