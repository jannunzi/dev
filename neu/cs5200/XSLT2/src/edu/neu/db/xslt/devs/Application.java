package edu.neu.db.xslt.devs;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Application {
	int id;
	String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Application(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Application() {
		super();
	}
}
