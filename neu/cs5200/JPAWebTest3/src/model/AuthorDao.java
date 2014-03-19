package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AuthorDao {

	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPAWebTest3");
	EntityManager em = null;
	
	public void createAuthor(Author author) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(author);
		em.getTransaction().commit();
		em.close();
	}
	
	public void createBook(Book book) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(book);
		em.getTransaction().commit();
		em.close();
	}

	public void testCreateFrankHerbert() {
		AuthorDao aDao = new AuthorDao();
		
		Author frank = new Author();
		frank.setSsn("1231234234");
		frank.setFirstName("Frank");
		frank.setLastName("Herbert");
		
		aDao.createAuthor(frank);
	}
	
	public Book findBookByISBN(String isbn) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Book book = em.find(Book.class, isbn);
		em.getTransaction().commit();
		em.close();
		return book;
	}
	
	public Author findAuthorBySSN(String ssn) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Author author = em.find(Author.class, ssn);
		em.getTransaction().commit();
		return author;
	}
	
	public List<Book> findBooksForAuthorSSN(String ssn) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Author author = em.find(Author.class, ssn);
		List<Book> books = author.getBooks();
		em.getTransaction().commit();
		em.close();
		return books;
	}
	
	public void addBookToAuthor(String ssn, String isbn) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Book book = em.find(Book.class, isbn);
		Author author = em.find(Author.class, ssn);
		System.out.println(book);
		System.out.println(author);
		author.addBook(book);
		em.merge(author);
		em.getTransaction().commit();
		em.close();
	}
	
	public void removeBookByISBN(String isbn) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Book book = em.find(Book.class, isbn);
		em.remove(book);
		em.getTransaction().commit();
		em.close();
	}
	
	public void changeBookTitle(String isbn, String newTitle) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Book book = em.find(Book.class, isbn);
		book.setTitle(newTitle);
		em.merge(book);
		em.getTransaction().commit();
		em.close();
	}
	
	public void testCreateBookDune() {
		AuthorDao aDao = new AuthorDao();
		
		Book dune = new Book();
		dune.setIsbn("4321-4312-5432-543");
		dune.setTitle("Dune");
		
		aDao.createBook(dune);
	}
	
	public void testGetBookAndAuthor() {
		AuthorDao dao = new AuthorDao();
		
		Book dune = this.findBookByISBN("1231234234");
		Author frank = this.findAuthorBySSN("1231234234");
		
		System.out.println(dune);
		System.out.println(frank);
		System.out.println(frank.getBooks());
	}
	
	public void testListAuthorsBooks(String ssn){
		List<Book> books = this.findBooksForAuthorSSN(ssn);
		for(Book book : books) {
			System.out.println(book);
		}
	}
	
	public List<Author> readAllAuthors() {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("select author from Author author");
		List<Author> authors = query.getResultList();
		em.getTransaction().commit();
		em.close();
		return authors;
	}
	
	public void testListAllAuthors() {
		List<Author> authors = this.readAllAuthors();
		for(Author author : authors) {
			System.out.println(author);
		}
	}
	
	public static void main(String[] args) {
		AuthorDao dao = new AuthorDao();
//		dao.testCreateBookDune();
//		dao.testGetBookAndAuthor();
//		dao.addBookToAuthor("1231234234", "4321-4312-5432-543");
//		dao.testListAuthorsBooks("1231234234");
//		dao.changeBookTitle("4321-4312-5432-543", "Dune !!!");
//		dao.removeBookByISBN("4321-4312-5432-543");
		dao.testListAllAuthors();
	}
}
