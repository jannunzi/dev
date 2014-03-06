package edu.cs3200.jdbc.ds.wam;

public class Developer {
	public int id = -1;
	public String firstName;
	public String lastName;
	public float salary;
	public Developer(int id, String firstName, String lastName, float salary) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
	}
	public Developer(String firstName, String lastName, float salary) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
	}
}
