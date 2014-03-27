package edu.neu.db.jaxb;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Library {
	List<Book> book;
	public List<Book> getBook() {
		return book;
	}
	public void setBook(List<Book> books) {
		this.book = books;
	}
	public Library(List<Book> books) {
		super();
		this.book = books;
	}
	public Library() {
		super();
	}
}
