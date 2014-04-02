package edu.neu.db.jpa.one2many;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Owner {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	String firstName;
	String lastName;
	@OneToMany(mappedBy="owner", cascade=CascadeType.ALL, orphanRemoval=true)
	List<House> houses = new ArrayList<House>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public List<House> getHouses() {
		return houses;
	}
	public void setHouses(List<House> houses) {
		this.houses = houses;
	}
	public Owner(int id, String firstName, String lastName, List<House> houses) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.houses = houses;
	}
	public Owner() {
		super();
	}
}
