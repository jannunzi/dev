package sqlfirst;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;



public class BookDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPACodeFirstClass");
	
	public void createBook(Book book) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(book);
		em.getTransaction().commit();
		em.close();
	}
	
	
	
	public static void main(String[] args) {
		BookDao bm = new BookDao();
		Book book = new Book();
		book.setTitle("I ROBOT");
		bm.createBook(book);

	}
}
