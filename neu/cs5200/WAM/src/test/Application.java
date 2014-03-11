package test;

public class Application {
	int id;
	int devId;
	String name;
	
	public Application(int id, int devId, String name) {
		this.id = id;
		this.devId = devId;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDevId() {
		return devId;
	}

	public void setDevId(int devId) {
		this.devId = devId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String toString() {
		return id + ") " + ", " + devId + " " + name;
	}
}
