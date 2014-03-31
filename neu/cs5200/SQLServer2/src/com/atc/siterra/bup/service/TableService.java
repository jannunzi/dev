package com.atc.siterra.bup.service;

import com.atc.siterra.bup.model.*;

import java.sql.*;
import java.util.*;

public class TableService
{
	private Connection connection = null;
	private PreparedStatement statement = null;
	private ResultSet results = null;
	
	public List<Table> getTables()
	{
		List<Table> tables = new ArrayList<Table>();
		
		try {
			Connection connection = getConnection();
			DatabaseMetaData meta = connection.getMetaData();
			results = meta.getTables(null, null, null, null);
			while(results.next()) {
				String tableName = results.getString(3);
				if(tableName.startsWith("sys") || tableName.startsWith("dt"))
					continue;
				Table table = new Table();
				table.name = results.getString(3);
				tables.add(table);
			}
			closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tables;
	}
	
	public List<Column> getColumns(String tableName)
	{
		List<Column> columns = new ArrayList<Column>();
		
		try {
			Connection connection = getConnection();
			DatabaseMetaData meta = connection.getMetaData();
			results = meta.getColumns(null, null, tableName, null);
			while(results.next()) {
				String columnName = results.getString(4);
				int columnType = results.getInt(5);
				Column column = new Column();
				column.name = columnName;
				column.type = columnType;
				columns.add(column);
			}
			closeConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return columns;
	}
	
	public Connection getConnection()
	{
		try {
			Driver d = (Driver)Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
			connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://QCSMN01:1433;databaseName=ShareGen", "semaan_app_user", "qcdb01");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public void closeConnection()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public TableService()
	{
	}
}
