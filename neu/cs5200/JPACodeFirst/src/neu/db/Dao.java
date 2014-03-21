package neu.db;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class Dao {

	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPACodeFirst");
	
	public void createDeveloper(Developer dev) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(dev);
		em.getTransaction().commit();
	}
	
	public void createDeveloperAndApplication(Developer developer, Application application) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(developer);
		em.persist(application);
		developer.getApplications().add(application);
		application.setDeveloper(developer);
		em.merge(developer);
		em.getTransaction().commit();
	}
	
	public void addApplicationToDeveloper(int devId, int appId) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		Developer dev = em.find(Developer.class, devId);
		Application app = em.find(Application.class, appId);
		dev.getApplications().add(app);
		em.merge(dev);
		em.getTransaction().commit();
	}
	
	public List<Application> getDevelopersApplications(int devId) {
		List<Application> apps = null;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Developer dev = em.find(Developer.class, devId);
		apps = dev.getApplications();
		
		em.getTransaction().commit();
		
		return apps;
	}
	
	public void reviewApplication(int devId, int appId, Review review) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(review);
		Application app = em.find(Application.class, appId);
		review.setApplication(app);
		em.merge(review);
		
		Developer dev = em.find(Developer.class, devId);
		dev.getReviews().add(review);
		em.merge(dev);
		
		em.getTransaction().commit();
	}
	
	public List<Review> reviewsForApplication(int appId) {
		List<Review> reviews = null;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select review from Review review join Application application where review.application = application");
		reviews = query.getResultList();
		
		em.getTransaction().commit();
		
		return reviews;
	}
	
	public List<Review> reviewsByDeveloper(int devId) {
		List<Review> reviews = null;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Developer dev = em.find(Developer.class, devId);
		reviews = dev.getReviews();
		
		em.getTransaction().commit();
		
		return reviews;
	}
	
	public void createYouTubeWidget(YouTube yt) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(yt);
		em.getTransaction().commit();
	}
	
	public void createHtmlWidget(Html yt) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(yt);
		em.getTransaction().commit();
	}
	
	public Html getHtmlWidget(int id) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		Html html = em.find(Html.class, id);
		em.getTransaction().commit();
		return html;
	}
	
	public static void main(String[] args) {

		Dao dao = new Dao();

		Html h2 = dao.getHtmlWidget(2);
		
		/*
		Html h1 = new Html();
		h1.setName("You Tube 1");
		h1.setHeight(100);
		h1.setWidth(200);
		h1.setContent("Hello World");
		dao.createHtmlWidget(h1);
		

		YouTube y1 = new YouTube();
		y1.setName("You Tube 1");
		y1.setHeight(100);
		y1.setWidth(200);
		y1.setUrl("css.com");
		dao.createYouTubeWidget(y1);

		List<Review> reviews = dao.reviewsByDeveloper(1);
		for(Review review : reviews) {
			System.out.println(review.getComment());
			Application app = review.getApplication();
			System.out.println(app.getName());
		}
		
		reviews = dao.reviewsForApplication(1);
		for(Review review : reviews) {
			System.out.println(review.getComment());
			Application app = review.getApplication();
			System.out.println(app.getName());
		}
		
		Review r1 = new Review();
		r1.setStars(4);
		r1.setComment("Awesome");
		dao.reviewApplication(1, 1, r1);
		Review r2 = new Review();
		r2.setStars(3);
		r2.setComment("So so");
		dao.reviewApplication(1, 2, r2);
*/		
		/*
		Developer alice = new Developer();
		alice.setUsername("alice");
		alice.setPassword("p1");
		dao.createDeveloper(alice);
		Developer bob = new Developer();
		bob.setUsername("bob");
		bob.setPassword("p2");
		Application twitter = new Application();
		twitter.setName("Twitter");
		dao.createDeveloperAndApplication(bob, twitter);
		dao.addApplicationToDeveloper(1, 2);

		List<Application> apps = dao.getDevelopersApplications(1);
		for(Application app:apps){
			System.out.println(app.getName());
		}
		*/
	}

}
