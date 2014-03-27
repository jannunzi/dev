package edu.neu.db.jaxb;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class LibraryJaxb
{
	public void serializeBook(Book book, String fileName) {
		File file = new File(fileName);
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(Book.class);
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.marshal(book, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void serializeLibrary(Library library, String fileName) {
		File file = new File(fileName);
		try {
			JAXBContext jaxbContext = JAXBContext.newInstance(Library.class);
			Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxbMarshaller.marshal(library, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) 
	{
		LibraryJaxb dao = new LibraryJaxb();
		
		Book book = new Book("Hobbit", "JRR Tolkien", "Fantasy", "Publisher", 12.23f, new Date());
		dao.serializeBook(book, "jaxb/book.xml");
		
		Book b1 = new Book("Book1", "Author1", "Genre1", "Publisher1", 12.23f, new Date());
		Book b2 = new Book("Book2", "Author2", "Genre2", "Publisher2", 12.23f, new Date());
		Book b3 = new Book("Book3", "Author3", "Genre3", "Publisher3", 12.23f, new Date());
		Book b4 = new Book("Book4", "Author4", "Genre4", "Publisher4", 12.23f, new Date());

		List<Book> books = new ArrayList<Book>();
		books.add(b1);
		books.add(b2);
		books.add(b3);
		books.add(b4);
		
		Library lib = new Library(books);
		dao.serializeLibrary(lib, "jaxb/library.xml");
		
	}
}
