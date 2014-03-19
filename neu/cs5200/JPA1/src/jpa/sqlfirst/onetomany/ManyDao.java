package jpa.sqlfirst.onetomany;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ManyDao {
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA1");
	
	public Many createMany(Many many) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(many);
		em.getTransaction().commit();
		em.close();
		return many;
	}
	
	public Many findManyByName(String name) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Many many = (Many)em.createQuery("select many from Many many where many.name = :name")
				.setParameter("name", name)
				.getSingleResult();
		
		em.getTransaction().commit();
		em.close();
		
		return many;
	}	

	public static void main(String[] args) {
		
		ManyDao dao = new ManyDao();
		
		Many many = new Many();
		many.setName("Many 1");
		many.setDate(Calendar.getInstance().getTime());

		dao.createMany(many);
	}
}
