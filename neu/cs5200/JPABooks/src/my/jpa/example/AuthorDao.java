package my.jpa.example;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AuthorDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPABooks");
	
	public void createAuthor(Author newAuthor) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(newAuthor);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Author readAuthorByPK(int id) {
		Author author = null;
		
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		author = em.find(Author.class, id);

		em.getTransaction().commit();
		em.close();
		
		return author;
	}
	
	public void updateAuthor(int id, Author newAuthor) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Author author = em.find(Author.class, id);
		author.setFirst(newAuthor.getFirst());
		author.setLast(newAuthor.getLast());
		em.merge(author);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteAuthor(int id) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, id);
		em.remove(author);
		
		em.getTransaction().commit();
		em.close();		
	}
	
	public List<Author> readAllAuthors() {
		List<Author> authors = new ArrayList<Author>();
		
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select author from Author author");
		authors = query.getResultList();
		
		em.getTransaction().commit();
		em.close();		

		return authors;
	}
	
	public List<Author> findByLastName(String last) {
		List<Author> authors = new ArrayList<Author>();
		
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Query query = em.createQuery("select author from Author author where author.last=:lastName");
		query.setParameter("lastName", last);
		authors = query.getResultList();
		
		em.getTransaction().commit();
		em.close();		

		return authors;		
	}
	
	public static void main(String[] args) {
		
		Author arthur = new Author();
		arthur.setFirst("Arthur");
		arthur.setLast("Clark");
		
		AuthorDao dao = new AuthorDao();
//		dao.createAuthor(arthur);
		
//		Author a = dao.readAuthorByPK(2);
	//	System.out.println(a);
		
//		arthur.setLast("C. Clark");
	//	dao.updateAuthor(2, arthur);
		
//		dao.deleteAuthor(2);
		
		List<Author> authors = dao.findByLastName("Herbert");
		for(Author author : authors) {
			System.out.println(author);
		}
	}

}
