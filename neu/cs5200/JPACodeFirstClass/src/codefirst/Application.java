package codefirst;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Application {

	@Id
	private int id;
	private String name;
	private Developer developers;
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
	public Application(){}
	public Application(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Developer getDevelopers() {
		return developers;
	}
	public void setDevelopers(Developer developers) {
		this.developers = developers;
	}
}
