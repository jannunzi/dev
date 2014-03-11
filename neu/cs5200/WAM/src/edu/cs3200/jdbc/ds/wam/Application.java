package edu.cs3200.jdbc.ds.wam;

public class Application {
	public int id = -1;
	public int devId = 1;
	public String name;
	public Application(int id, String name) {
		this.id = id;
		this.name = name;
	}
	public Application(String name) {
		this.name = name;
	}
	public Application(){}
}
