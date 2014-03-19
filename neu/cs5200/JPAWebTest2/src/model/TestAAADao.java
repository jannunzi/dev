package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TestAAADao {

	static EntityManagerFactory factory = 
			Persistence.createEntityManagerFactory("JPAWebTest2");
	
	public void create() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		TestAAA obj = new TestAAA();
		obj.setName("wwwwffff");
		em.persist(obj);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		TestAAADao dao = new TestAAADao();
		dao.create();
	}

}
