package test;

public class Developer {
	protected int id;
	protected String firstName;
	protected String lastName;
	protected float salary;
	
	public Developer(int id, String fn, String ln, float s) {
		this.id = id;
		this.firstName = fn;
		this.lastName = ln;
		this.salary = s;
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
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Developer alice = new Developer(0, "Alice", "Wonderland", 100000);
		System.out.println(alice);
	}
}
