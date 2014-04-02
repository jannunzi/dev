package edu.neu.db.jpa.one2many;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class HouseDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA3");
	EntityManager em = null;
	
	public void removeOwnerById(int ownerId) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		// house is also removed because of orphanRemoval=true
		Owner owner = em.find(Owner.class, ownerId);
		em.remove(owner);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createOwnerAndHouse(Owner owner, House house) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		// house is also persisted because persist of owner is cascaded to house
		owner.getHouses().add(house);
		em.persist(owner);
		
		em.getTransaction().commit();
		em.close();
	}
 	public void createHouse(House house) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(house);
		
		em.getTransaction().commit();
		em.close();
	}
	public void createOwner(Owner owner) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(owner);
		
		em.getTransaction().commit();
		em.close();
	}
	public void template() {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		
		
		em.getTransaction().commit();
		em.close();
	}
	public static void main(String[] args) {
		HouseDao dao = new HouseDao();
		
		dao.removeOwnerById(5);
		
		/*
		Owner bob = new Owner();
		bob.setFirstName("Bob");
		bob.setLastName("Marley");

		House house2 = new House();
		house2.setBathrooms(3);
		house2.setBedrooms(5);
		house2.setSquareFeet(1234);

		dao.createOwnerAndHouse(bob, house2);
		
		House house1 = new House();
		house1.setBathrooms(3);
		house1.setBedrooms(5);
		house1.setSquareFeet(1234);
		dao.createHouse(house1);
		*/
		/*
		Owner alice = new Owner();
		alice.setFirstName("Alice");
		alice.setLastName("Wonderland");
		dao.createOwner(alice);
		*/
	}

}
