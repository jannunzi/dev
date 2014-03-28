package edu.neu.db.xml;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class App {
	String nombre;
	double precio;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public App(String nombre, double precio) {
		super();
		this.nombre = nombre;
		this.precio = precio;
	}
	public App() {
		super();
	}
}
