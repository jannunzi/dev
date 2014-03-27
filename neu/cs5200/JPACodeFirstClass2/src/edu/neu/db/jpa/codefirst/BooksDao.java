package edu.neu.db.jpa.codefirst;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BooksDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPACodeFirstClass2");
	EntityManager em = null;
	
	public void createBook(Book book) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createAuthor(Author author) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(author);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void authorWroteBook(int authorId, int bookId) {
		em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, authorId);
		Book   book   = em.find(Book.class, bookId);
		author.getBooks().add(book);
		book.setAuthor(author);
		
		em.merge(author);
		em.merge(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Book> getBooksForAuthor(int authorId) {
		List<Book> books = new ArrayList<Book>();
		em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, authorId);
		books = author.getBooks();
		
		em.getTransaction().commit();
		em.close();
		return books;
	}
	
	public void authorReviewsBook(int authorId, int bookId, Review review) {
		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(review);
		
		Author author = em.find(Author.class, authorId);
		Book   book   = em.find(Book.class, bookId);
		
		review.setReviewed(book);
		review.setReviewer(author);
		em.merge(review);

		author.getReviews().add(review);
		book.getReviews().add(review);		
		em.merge(book);		
		em.merge(author);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void template() {
		em = factory.createEntityManager();
		em.getTransaction().begin();

		
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		BooksDao dao = new BooksDao();

		/*
		Review review = new Review();
		review.setComments("Awesome Book");
		review.setStars(5);
		
		dao.authorReviewsBook(1, 1, review);	
		*/
		
		
		List<Book> books = dao.getBooksForAuthor(1);
		for(Book book : books) {
			System.out.println(book.getTitle());
		}
		
		/*
		dao.authorWroteBook(1, 1);
		dao.authorWroteBook(1, 2);
		
		Book book = new Book();
		book.setTitle("100 Years of Solitude");
		dao.createBook(book);
		
		book= new Book();
		book.setTitle("Do Robots Dream of Electric Sheet");
		dao.createBook(book);
		
		Author author = new Author();
		author.setName("Name 1");
		dao.createAuthor(author);

		author = new Author();
		author.setName("Name 2");
		dao.createAuthor(author);
		*/
		
	}
}
