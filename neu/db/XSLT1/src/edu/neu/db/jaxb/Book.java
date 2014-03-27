package edu.neu.db.jaxb;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Book {
	String title;
	String author;
	String genre;
	String publisher;
	float price;
	Date date;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Book(String title, String author, String genre, String publisher,
			float price, Date date) {
		super();
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.publisher = publisher;
		this.price = price;
		this.date = date;
	}
	public Book() {
		super();
	}
}
