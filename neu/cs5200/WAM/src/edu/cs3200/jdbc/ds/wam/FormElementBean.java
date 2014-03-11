package edu.cs3200.jdbc.ds.wam;

import java.sql.*;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.*;
import javax.sql.*;

public class FormElementBean {
	
//	@Resource(name="jdbc/cs3200")
	private DataSource ds;
 
	int id, editId = -1;
	String name;
	String action;

	String selectAllFormElements		= "SELECT * FROM `FORMELEMENT`;";
	String selectFormElementsForColumn	= "SELECT * FROM `FORMELEMENT` WHERE FORMID=?;";
	String deleteFormElementForId		= "DELETE FROM `FORMELEMENT` WHERE ID=?";
	String insertFormElement			= "INSERT INTO `FORMELEMENT` VALUES (NULL, ?, ?, ?, ?, ?)";
	String updateFormElement			= "UPDATE `FORMELEMENT` SET NAME=?, TYPE=?, VALUE=?, DEFAULTVALUE=?, FORMID=? WHERE ID=?";

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet results = null;
	List<FormElement> list = null;
	FormElement widget = null;
	
	public boolean create(FormElement newFormElement) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(insertFormElement);
		stmt.setString(1, newFormElement.name);
		stmt.setString(2, newFormElement.type);
		stmt.setString(3, newFormElement.value);
		stmt.setString(4, newFormElement.defaultValue);
		stmt.setInt(   5, newFormElement.formId);
		int widgets = stmt.executeUpdate();
		connection.close();
		if(widgets > 0)
			return true;
		return false;
	}
	
	public boolean update(FormElement newFormElement) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(updateFormElement);
		stmt.setString(1, newFormElement.name);
		stmt.setString(2, newFormElement.type);
		stmt.setString(3, newFormElement.value);
		stmt.setString(4, newFormElement.defaultValue);
		stmt.setInt(   5, newFormElement.formId);
		stmt.setInt(   6, newFormElement.id);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}
	
	public List<FormElement> readList() throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectAllFormElements);
		results = stmt.executeQuery();
		list = new ArrayList<FormElement>();
		while(results.next()) {
			widget = new FormElement();
			widget.id = results.getInt("id");
			widget.name = results.getString("name");
			widget.type = results.getString("type");
			widget.value = results.getString("value");
			widget.defaultValue = results.getString("defaultType");
			widget.formId = results.getInt("formId");
			list.add(widget);
		}
		connection.close();
		return list;
	}
	
	public List<FormElement> readList(int formId) throws SQLException{
 
		connection = ds.getConnection();
		stmt = connection.prepareStatement(selectFormElementsForColumn);
		stmt.setInt(1, formId);
		results = stmt.executeQuery();
		list = new ArrayList<FormElement>();
		while(results.next()) {
			widget = new FormElement();
			widget.id = results.getInt("id");
			widget.name = results.getString("name");
			widget.type = results.getString("type");
			widget.value = results.getString("value");
			widget.defaultValue = results.getString("defaultType");
			widget.formId = results.getInt("formId");
			list.add(widget);
		}
		connection.close();
		return list;
	}
	
	public boolean delete(int formElementId) throws SQLException {
		connection = ds.getConnection();
		stmt = connection.prepareStatement(deleteFormElementForId);
		stmt.setInt(1, formElementId);
		int rows = stmt.executeUpdate();
		connection.close();
		if(rows > 0)
			return true;
		return false;
	}

	public FormElementBean(){
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
