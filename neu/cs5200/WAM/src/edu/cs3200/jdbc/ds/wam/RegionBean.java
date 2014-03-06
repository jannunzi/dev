package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class RegionBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, top, left, width, height, editId = -1;
	String name, bgColor, fgColor, content;
	String action;

	String selectAllRegions	 = "SELECT * FROM REGION;";
	String selectRegionsForPage	 = "SELECT * FROM REGION WHERE PAGEID=?;";
	String deleteRegionForId = "DELETE FROM REGION WHERE ID=?";
	String insertRegion		 = "INSERT INTO REGION VALUES (NULL,?,?,?,?,?,?,?,?,NULL)";
	String updateRegion		 = "UPDATE REGION SET NAME=?, TOP=?, CONTENT=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Region> list = null;
	Region region = null;
	
	public boolean create(Region newRegion) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertRegion);
		stmt.setString(1, newRegion.name);
		stmt.setInt(2, newRegion.top);
		stmt.setInt(3, newRegion.left);
		stmt.setInt(4, newRegion.width);
		stmt.setInt(5, newRegion.height);
		stmt.setString(6, newRegion.bgColor);
		stmt.setString(7, newRegion.fgColor);
		stmt.setString(8, newRegion.content);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Region newRegion) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateRegion);
		stmt.setString(1, newRegion.name);
		stmt.setInt(2, newRegion.top);
		stmt.setString(3, newRegion.content);
		stmt.setInt(4, newRegion.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Region> readList() throws SQLException{
		 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllRegions);
		results = stmt.executeQuery();
		list = new ArrayList<Region>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			content = results.getString("content");
			region = new Region(id, name, content);
			list.add(region);
		}
		connection.close();
		return list;
	}
	
	public List<Region> readList(int pageId) throws SQLException{
		 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectRegionsForPage);
		stmt.setInt(1, pageId);
		results = stmt.executeQuery();
		list = new ArrayList<Region>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			content = results.getString("content");
			region = new Region(id, name, content);
			list.add(region);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int regionId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteRegionForId);
		stmt.setInt(1, regionId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public RegionBean(){
//		/*
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/cs3200");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	//	*/
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
