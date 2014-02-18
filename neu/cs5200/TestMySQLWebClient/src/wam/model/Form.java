package wam.model;

public class Form {
	
	protected long id;
	protected String name;

	public Form() {
		this(null);
	}
	public Form(String name) {
		this.name = name;
	}
	
	public long getId() { return id; }
	public void setId(long id) { this.id = id; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String toString() {
		return id + " " + name;
	}
}
