package edu.neu.db.xml;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Developer {
	String firstName;
	String lastName;
	double salary;
	List<Application> application;
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
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public Developer(String firstName, String lastName, double salary) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
	}
	public Developer() {
		super();
	}
	public List<Application> getApplication() {
		return application;
	}
	public void setApplication(List<Application> application) {
		this.application = application;
	}
	public Developer(String firstName, String lastName, double salary,
			List<Application> application) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
		this.application = application;
	}
}
