package com.atc.siterra.bup.model;

import java.sql.DriverManager;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Database {
	@XmlAttribute
	public String name;
	@XmlAttribute
	public String driver;
	@XmlAttribute
	public String vendor;
	@XmlAttribute
	public String type;
	@XmlAttribute
	public String server;
	@XmlAttribute
	public String port;
	@XmlAttribute
	public String username;
	@XmlAttribute
	public String password;
	@XmlElement
	public Tables tables = new Tables();
	public Database(String name, String driver, String vendor, String type,
			String server, String port, String username, String password,
			Tables tables) {
		super();
		this.name = name;
		this.driver = driver;
		this.vendor = vendor;
		this.type = type;
		this.server = server;
		this.port = port;
		this.username = username;
		this.password = password;
		this.tables = tables;
	}
	public Database() {
		super();
	}
	private String urlTemplate = "jdbc:{vendor}:{type}://{server}:{port};databaseName={name}";
	public String getUrlString() {
		String url = new String(urlTemplate);
		url = url.replace("{vendor}", this.vendor);
		url = url.replace("{type}", this.type);
		url = url.replace("{server}", this.server);
		url = url.replace("{port}", this.port);
		url = url.replace("{name}", this.name);
		return url;
	}
}


//com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
//connection = DriverManager.getConnection("jdbc:microsoft:sqlserver://QCSMN01:1433;databaseName=ShareGen", "semaan_app_user", "qcdb01");
