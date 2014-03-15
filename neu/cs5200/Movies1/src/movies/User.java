package movies;

public class User {
	String username;
	String password;
	String firstName;
	String lastName;
	public User(){};
	public User(String u, String p, String f, String l) {
		this.username = u;
		password = p;
		firstName = f;
		lastName = l;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
}
