package jpa.sqlfirst.map;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class Dao {
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA1");
	
	public void createMapOne(MapOne one) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(one);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createMapMany(MapMany many) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(many);
		
		em.getTransaction().commit();
		em.close();
	}

	public void createMapRelation(int oneId, int manyId) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		// find entities
		MapOne one = em.find(MapOne.class, oneId);
		MapMany many = em.find(MapMany.class, manyId);

		// Create Map instance
		Map map = new Map();
		map.setName(one.getName() + " maps to " + many.getName());
		
		//
		one.addMap(map);
		many.addMap(map);
		
		//
		em.merge(one);
		em.merge(many);
		
		//
		em.getTransaction().commit();
		em.close();
	}
	
	public List<MapMany> getAllMapManys() {
		List<MapMany> manys = new ArrayList<MapMany>();
		
		EntityManager em = factory.createEntityManager();
		
		Query query = em.createQuery("select many from MapMany many");
		manys = query.getResultList();
		
		return manys;
	}
	
	public List<MapOne> getAllMapOnes() {
		List<MapOne> ones = new ArrayList<MapOne>();

		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select ones from MapOne ones");
		ones = (List<MapOne>)query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return ones;
	}
	
	public List<MapMany> getAllManysForOneName(String oneName) {
		List<MapMany> ones = new ArrayList<MapMany>();
		
		EntityManager em = factory.createEntityManager();
		
		Query query = em.createQuery("select many from MapMany many join Map map join MapOne one where one.name=:oneName and map.mapone = one and map.mapmany = many");
		query.setParameter("oneName", oneName);
		ones = query.getResultList();
		
		return ones;
	}
	
	public void testCreateMap() {
		this.createMapRelation(1, 1);
	}
	
	public void testCreate() {
		MapOne one = new MapOne();
		one.setName("one 1");
		
		MapMany many = new MapMany();
		many.setName("many 1");
		
		this.createMapMany(many);
		this.createMapOne(one);
	}
	
	public static void main(String[] args) {
		Dao dao = new Dao();
		
		//dao.testCreate();
		//dao.testCreateMap();
		List<MapOne> ones = dao.getAllMapOnes();
		for(MapOne one : ones) {
			System.out.println(one);
		}
		
		List<MapMany> manys = dao.getAllMapManys();
		for(MapMany many : manys) {
			System.out.println(many);
		}
		
		System.out.println("getAllManysForOneName one 1");
		manys = dao.getAllManysForOneName("one 1");
		for(MapMany many : manys) {
			System.out.println(many);
		}
		System.out.println("getAllManysForOneName one 2");
		manys = dao.getAllManysForOneName("one 2");
		for(MapMany many : manys) {
			System.out.println(many);
		}
		System.out.println("getAllManysForOneName one 3");
		manys = dao.getAllManysForOneName("one 3");
		for(MapMany many : manys) {
			System.out.println(many);
		}
	}
}
