package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Table123Dao {

	private static EntityManagerFactory factory =
			Persistence.createEntityManagerFactory("JPAWebTest2");

	public void create(String name) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Table123 obj = new Table123();
		obj.setName("hhhh");
		obj.setId(2);
		em.persist(obj);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		Table123Dao dao = new Table123Dao();
		dao.create("aaa");
	}

}
