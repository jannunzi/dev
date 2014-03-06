package edu.cs3200.jdbc.ds.wam;

public class Page {
	public int id = -1;
	public String name;
	public Page(int id, String name) {
		this.id = id;
		this.name = name;
	}
	public Page(String name) {
		this.name = name;
	}
}
