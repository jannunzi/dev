package codefirst;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DeveloperDao {
	
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPAWebTest3");
	
	public void createDeveloper(Developer dev) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(dev);
		
		em.getTransaction().commit();
		em.close();
	}
	public void createApplication(Application app) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(app);
		
		em.getTransaction().commit();
		em.close();
	}
	public void createDeveloperAndApplication(Developer dev, Application app) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(dev);
		em.persist(app);
		dev.getApplications().add(app);
		em.merge(dev);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		DeveloperDao dao = new DeveloperDao();
/*		Developer alice = new Developer();
		alice.setName("Alice Wonderland");
		dao.createDeveloper(alice);
		*/
/*		Application facebook = new Application();
		facebook.setName("Facebook");
		dao.createApplication(facebook);
		*/
		Developer bob = new Developer();
		bob.setName("Bob Marley");
		Application twitter = new Application();
		twitter.setName("Twitter");
		dao.createDeveloperAndApplication(bob, twitter);
	}

}
