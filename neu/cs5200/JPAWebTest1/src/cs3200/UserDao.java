package cs3200;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class UserDao {

	private static final String PERSISTENCE_UNIT_NAME = "JPAWebTest1";
	private static EntityManagerFactory factory =
			Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);

	public void createUser(User user) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(user);

		em.getTransaction().commit();
		em.close();
	}
	
	public List<User> readAllUsers() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select u from User u");
		List<User> users = (List<User>)query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return users;
	}
	
	public User readUser(String username) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		User user = em.find(User.class, username);
		
		em.getTransaction().commit();
		em.close();
		
		return user;
	}
	
	public void updateUser(User user) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.merge(user);

		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteUser(String username) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		User user = em.find(User.class, username);
		em.remove(user);
		
		em.getTransaction().commit();
		em.close();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDao dao = new UserDao();

		dao.deleteUser("user3");

		List<User> users = dao.readAllUsers();
		for(User user : users) {
			System.out.println(user);
		}
	}
}
