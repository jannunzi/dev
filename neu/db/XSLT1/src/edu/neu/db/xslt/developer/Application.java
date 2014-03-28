package edu.neu.db.xslt.developer;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Application 
{
	int id;
	String name;
	String genre;
	Date date;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Application(int id, String name, String genre, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.genre = genre;
		this.date = date;
	}
	public Application() {
		super();
	}
}
