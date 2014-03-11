package cs3200;

public class Developer {
	int id;
	String firstName;
	String lastName;
	float salary;
	public Developer(){}
	public Developer(String f, String l, float s) {
		firstName = f;
		lastName = l;
		salary = s;
	}
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
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public String toString() {
		return id + ") " + firstName + " " + lastName + " $" + salary;
	}
}
