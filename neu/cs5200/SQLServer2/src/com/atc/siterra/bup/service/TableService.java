package com.atc.siterra.bup.service;

import com.atc.siterra.bup.model.*;

import java.io.File;
import java.sql.*;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class TableService
{
	private Database database = null;
	private Connection connection = null;
	private PreparedStatement statement = null;
	private ResultSet results = null;
	
	public Database getDatabase()
	{
		Tables tables = new Tables();
		tables.table = this.getTables();
		
		for(Table table:tables.table) {
			table.column = this.getColumns(table.name);
		}
		
		this.database.tables = tables;
		return this.database;
	}
	
	public void exportDataseToXml(Database database, String xmlFileName) {
		File xmlFile = new File(xmlFileName);
		try {
			JAXBContext jaxb = JAXBContext.newInstance(Database.class);
			Marshaller marshaller = jaxb.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.marshal(database, xmlFile);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
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
			ResultSetMetaData meta2 = results.getMetaData();
			int columnCount = meta2.getColumnCount();
			/*
			for(int i=1; i<=columnCount; i++)
			{
				System.out.println(meta2.getColumnLabel(i));
				System.out.println(meta2.getColumnName(i));
				System.out.println(meta2.getColumnTypeName(i));
				System.out.println("------------");
			}
			*/
			while(results.next()) {
				String columnName = results.getString("COLUMN_NAME");
				int columnType = results.getInt("DATA_TYPE");
				int size = results.getInt("COLUMN_SIZE");
				Column column = new Column();
				column.name = columnName;
				column.type = columnType;
				column.size = size;
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
			Driver d = (Driver)Class.forName(this.database.driver).newInstance();
			connection = DriverManager.getConnection(this.database.getUrlString(),
					this.database.username, this.database.password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public void closeConnection()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public TableService(Database database)
	{
		this.database = database;
	}
	
	public static void main(String[] args) {
		Database db = new Database("ShareGen",
				"com.microsoft.jdbc.sqlserver.SQLServerDriver",
				"microsoft","sqlserver","QCSMN01","1433",
				"semaan_app_user","qcdb01",null);
		TableService svc = new TableService(db);

		db = svc.getDatabase();
		
		List<Table> tables = db.tables.table;
		for(Table table : tables) {
			System.out.println(table.name);
			for(Column column:table.column) {
				System.out.println("\t"+column.name);
			}
		}
		
		svc.exportDataseToXml(db, "siterra/bup.xml");
	}
}
