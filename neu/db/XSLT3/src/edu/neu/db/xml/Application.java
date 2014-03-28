package edu.neu.db.xml;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Application {
	String name;
	double price;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Application(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	public Application() {
		super();
	}
}
