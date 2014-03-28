package edu.neu.db.xslt.developer;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Developer {
	int id;
	String firstName;
	String lastName;
	List<Application> application;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public List<Application> getApplication() {
		return application;
	}
	public void setApplication(List<Application> application) {
		this.application = application;
	}
	public Developer(int id, String firstName, String lastName,
			List<Application> application) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.application = application;
	}
	public Developer() {
		super();
	}
}
