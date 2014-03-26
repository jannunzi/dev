package neu.db;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Dao2 {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPACodeFirst");
	EntityManager em = null;
	
	public void createDeveloper(Developer dev) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(dev);
		em.getTransaction().commit();
		em.close();
	}
	
	public void createApplication(int devId, Application app) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(app);
		em.getTransaction().commit();
		em.close();
	}

	public void createReview(int devId, int appId, Review rev) {
		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(rev);
		
		Developer dev = em.find(Developer.class, devId);
		dev.getReviews().add(rev);
		em.merge(dev);

		Application app = em.find(Application.class, appId);
		app.getReviews().add(rev);
		em.merge(app);

		rev.setApplication(app);
		rev.setReviewedBy(dev);
		em.merge(rev);
		
		em.persist(rev);
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Review> reviewsForApplication(int appId) {
		List<Review> reviews = new ArrayList<Review>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Application app = em.find(Application.class, appId);
		reviews = app.getReviews();
		
		em.getTransaction().commit();
		em.close();
		
		return reviews;
	}
	
	public List<Review> reviewsByDeveloper(int devId) {
		List<Review> reviews = new ArrayList<Review>();
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Developer dev = em.find(Developer.class, devId);
		reviews = dev.getReviews();
		
		em.getTransaction().commit();
		em.close();
		
		return reviews;
	}
	
	public void devFollowsDev(int devFollowsId, int devFollowedId) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Developer devFollows  = em.find(Developer.class, devFollowsId);
		Developer devFollowed = em.find(Developer.class, devFollowedId);
		
		devFollows.getFollows().add(devFollowed);
		em.merge(devFollows);
		
		devFollowed.getFollowedBy().add(devFollows);
		em.merge(devFollowed);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void Template() {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		Dao2 dao = new Dao2();
		
		/*
		Review rev1 = new Review();
		rev1.setComment("This is the comment 3");
		rev1.setStars(3);
		dao.createReview(1, 1, rev1);
		
		Review rev2 = new Review();
		rev2.setComment("This is the comment 4");
		rev2.setStars(4);
		dao.createReview(2, 1, rev2);
		*/
		
		System.out.println("Reviews by Developer");
		List<Review> reviews = dao.reviewsByDeveloper(1);
		for(Review review : reviews) {
			System.out.println(review.getComment() + " " + review.getStars());
		}
		
		System.out.println("Reviews for Application");
		reviews = dao.reviewsForApplication(1);
		for(Review review : reviews) {
			System.out.println(review.getComment() + " " + review.getStars());
		}
		
		dao.devFollowsDev(1, 2);
		dao.devFollowsDev(1, 3);
		dao.devFollowsDev(1, 4);
		
		dao.devFollowsDev(2, 3);
		dao.devFollowsDev(2, 4);

		dao.devFollowsDev(3, 4);		
	}
}