package jpa.sqlfirst.simple;

import java.sql.Date;
import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class SimpleOneDao {

	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA1");

	public void create(SimpleOne simple) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(simple);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		SimpleOne simple = new SimpleOne();
		simple.setName("ewq");
		simple.setDate(Calendar.getInstance().getTime());

		SimpleOneDao dao = new SimpleOneDao();
		dao.create(simple);
	}

}
