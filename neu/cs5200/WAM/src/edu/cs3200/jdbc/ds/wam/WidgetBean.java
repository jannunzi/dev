package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class WidgetBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllWidgets		  = "SELECT * FROM `WIDGET`;";
	String selectWidgetsForColumn = "SELECT * FROM `WIDGET` WHERE COLID=?;";
	String deleteWidgetForId	  = "DELETE FROM `WIDGET` WHERE ID=?";
	String insertWidget			  = "INSERT INTO `WIDGET` (ID, COLID, NAME, WIDGETTYPE, URL, HTML) VALUES (NULL, ?, ?, ?, ?, ?)";
	String updateWidget			  = "UPDATE `WIDGET` SET COLID=?, NAME=?, WIDGETTYPE=?, URL=?, HTML=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<Widget> list = null;
	Widget widget = null;
	
	public boolean create(Widget newWidget) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertWidget);
		stmt.setInt(1, newWidget.colId);
		stmt.setString(2, newWidget.name);
		stmt.setString(3, newWidget.widgetType);
		stmt.setString(4, newWidget.url);
		stmt.setString(5, newWidget.html);
		int widgets = stmt.executeUpdate();
		connection.close();
		if(widgets > 0)
			return true;
		return false;
	}
	
	public boolean update(Widget newWidget) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateWidget);
		stmt.setInt(1, newWidget.colId);
		stmt.setString(2, newWidget.name);
		stmt.setString(3, newWidget.widgetType);
		stmt.setString(4, newWidget.url);
		stmt.setString(5, newWidget.html);
		stmt.setInt(6, newWidget.id);
		int rows = stmt.executeUpdate();
		connection.close();
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
			widget = new Widget();
			widget.id = results.getInt("id");
			widget.name = results.getString("name");
			widget.html = results.getString("html");
			widget.url = results.getString("url");
			widget.widgetType = results.getString("widgetType");
			widget.colId = results.getInt("colId");
			list.add(widget);
		}
		connection.close();
		return list;
	}
	
	public List<Widget> readList(int colId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectWidgetsForColumn);
		stmt.setInt(1, colId);
		results = stmt.executeQuery();
		list = new ArrayList<Widget>();
		while(results.next()) {
			widget = new Widget();
			widget.id = results.getInt("id");
			widget.name = results.getString("name");
			widget.html = results.getString("html");
			widget.url = results.getString("url");
			widget.widgetType = results.getString("widgetType");
			widget.colId = results.getInt("colId");
			list.add(widget);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int rowId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteWidgetForId);
		stmt.setInt(1, rowId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public WidgetBean(){
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
