package model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class BooksDAO {

	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA2");
	
	public void createBook(Book book) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createAuthor(Author author) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(author);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Author findByPk(int id) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Author author = em.find(Author.class, id);
		
		em.getTransaction().commit();
		em.close();
		
		return author;
	}
	
	public void updateBook(int id, Book newBook) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Book book = em.find(Book.class, id);
//		book.setTitle(newBook.getTitle());
		book.setPublicationDate(newBook.getPublicationDate());
		em.merge(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteBookByPk(int id) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Book book = em.find(Book.class, id);
		em.remove(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Book> readAllBooks() {
		List<Book> books = new ArrayList<Book>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select book from Book book");
		books = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return books;
	}
	
	public List<Book> readBookByTitle(String title) {
		List<Book> books = new ArrayList<Book>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select book from Book book where book.title = :bookTitle");
		query.setParameter("bookTitle", title);
		books = query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return books;
	}
	
	public static void main(String[] args) {
		BooksDAO dao = new BooksDAO();
		/*
		Book iRobot = new Book();
		iRobot.setTitle("I Robot");		
		dao.createBook(iRobot);*/
		
		/*
		Author issac = new Author();
		issac.setName("Issac Asimov");
		dao.createAuthor(issac);*/
		
		Calendar cal = Calendar.getInstance();
/*		
		Author jrr = new Author();
		jrr.setName("JRR Tolkien");
		jrr.setDateOfBirth(cal.getTime());
		dao.createAuthor(jrr);*/
/*		
		Author a = dao.findByPk(2);
		System.out.println(a.getName());
		*/
		/*
		Book newiRobot = new Book();
		newiRobot.setTitle("New I Robot");
		newiRobot.setPublicationDate(cal.getTime());
		dao.updateBook(1, newiRobot);
		*/
//		dao.deleteBookByPk(2);
		
		List<Book> books = dao.readBookByTitle("Dune");
		for(Book book : books) {
			System.out.println(book.getTitle());
		}
	}

}
