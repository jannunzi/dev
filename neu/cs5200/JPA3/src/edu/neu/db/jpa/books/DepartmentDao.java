package edu.neu.db.jpa.books;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DepartmentDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA3");
	EntityManager em = null;
	
	public void template() {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createDepartment(Department dept) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(dept);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createEmployee(Employee employee) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(employee);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Department getDepartment(int deptId) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Department d = em.find(Department.class, deptId);
		
		em.getTransaction().commit();
		em.close();
		
		return d;
	}
	
	public void removeDepartment(int deptId) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Department d = em.find(Department.class, deptId);
		em.remove(d);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		DepartmentDao dao = new DepartmentDao();

		Employee e1 = new Employee();
		e1.name = "Employee 1";
		Employee e2 = new Employee();
		e2.name = "Employee 2";
		List<Employee> es = new ArrayList<Employee>();
		es.add(e1);
		es.add(e2);
		
		Department d1 = new Department();
		d1.name = "Department 1";
		d1.setEmployees(es);
		
		dao.createDepartment(d1);
		
/*
		dao.removeDepartment(1);
		Department d = dao.getDepartment(1);
		System.out.println(d.name);
		List<Employee> es = d.getEmployees();
		for(Employee e: es) {
			System.out.println(e.name);
		}
*/
		
		/*
		
		Department hr = new Department();
		hr.name = "Human Resources";
		dao.createDepartment(hr);

		Employee alice = new Employee();
		alice.name = "Alice";
		dao.createEmployee(alice);
		*/
	}

}
