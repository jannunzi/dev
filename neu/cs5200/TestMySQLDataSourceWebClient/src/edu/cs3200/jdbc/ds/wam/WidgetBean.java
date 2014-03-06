package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class WidgetBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, top, left, width, height, editId = -1;
	String name, bgColor, fgColor, content;
	String action;

	String selectAllWidgets	 = "SELECT * FROM WIDGET;";
	String deleteWidgetForId = "DELETE FROM WIDGET WHERE ID=?";
	String insertWidget		 = "INSERT INTO WIDGET VALUES (NULL,?,?,?,?,?,?,?,?)";
	String updateWidget		 = "UPDATE WIDGET SET NAME=?, TOP=?, CONTENT=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Widget> list = null;
	Widget widget = null;
	
	public boolean create(Widget newWidget) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertWidget);
		stmt.setString(1, newWidget.name);
		stmt.setInt(2, newWidget.top);
		stmt.setInt(3, newWidget.left);
		stmt.setInt(4, newWidget.width);
		stmt.setInt(5, newWidget.height);
		stmt.setString(6, newWidget.bgColor);
		stmt.setString(7, newWidget.fgColor);
		stmt.setString(8, newWidget.content);
		int rows = stmt.executeUpdate();
		if(rows > 0)
			return true;
		return false;
	}
	
	public boolean update(Widget newWidget) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateWidget);
		stmt.setString(1, newWidget.name);
		stmt.setInt(2, newWidget.top);
		stmt.setString(3, newWidget.content);
		stmt.setInt(4, newWidget.id);
		int rows = stmt.executeUpdate();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<Widget> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllWidgets);
		results = stmt.executeQuery();
		list = new ArrayList<Widget>();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			content = results.getString("content");
			widget = new Widget(id, name, content);
			list.add(widget);
		}
		return list;
	}
	
	public boolean delete(int widgetId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteWidgetForId);
		stmt.setInt(1, widgetId);
		int rows = stmt.executeUpdate();
		if(rows > 0)
			return true;
		return false;
	}
	
	public WidgetBean(){
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
