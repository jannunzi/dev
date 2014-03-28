package edu.neu.db.xslt.devs;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Developer {
	int id;
	String name;
	List<Application> application;
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
	public List<Application> getApplication() {
		return application;
	}
	public void setApplication(List<Application> application) {
		this.application = application;
	}
	public Developer(int id, String name, List<Application> application) {
		super();
		this.id = id;
		this.name = name;
		this.application = application;
	}
	public Developer() {
		super();
	}
}
