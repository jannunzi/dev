package jpa.sqlfirst.onetomany;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class OneDao {
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA1");
	
	public One createOne(One one) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(one);
		em.getTransaction().commit();
		em.close();
		return one;
	}
	
	public void addManyToOne(One one, Many many) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		one = em.find(One.class, one.getId());
		many = em.find(Many.class, many.getId());
		one.addMany(many);
		em.merge(one);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public One findOneByName(String name) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		One one = (One)em.createQuery("select one from One one where one.name = :name").setParameter("name", name).getSingleResult();
		
		em.getTransaction().commit();
		em.close();
		
		return one;
	}
	
	public void addManyToOneByName(String oneName, String manyName) {
		OneDao odao = new OneDao();
		ManyDao mdao = new ManyDao();
		
		Many many = mdao.findManyByName(manyName);
		One one = odao.findOneByName(oneName);
		odao.addManyToOne(one, many);
	}
	
	public static void main(String[] args) {

		OneDao odao = new OneDao();
		ManyDao mdao = new ManyDao();

		/*		
		Many many = new Many();
		many.setName("Many 456");
		many.setDate(Calendar.getInstance().getTime());
		mdao.createMany(many);
		
		One one = new One();
		one.setName("One 234");
		one.setDate(Calendar.getInstance().getTime());
		
		odao.createOne(one);
		
		odao.addManyToOne(one, many);
	*/

		odao.addManyToOneByName("One 123", "Many AAA");
	}
}
