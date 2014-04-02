package edu.neu.db.jpa.one2many;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class House {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	double squareFeet;
	int bedrooms;
	int bathrooms;
	@ManyToOne
	@JoinColumn(name="ownerId")
	Owner owner;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getSquareFeet() {
		return squareFeet;
	}
	public void setSquareFeet(double squareFeet) {
		this.squareFeet = squareFeet;
	}
	public int getBedrooms() {
		return bedrooms;
	}
	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}
	public int getBathrooms() {
		return bathrooms;
	}
	public void setBathrooms(int bathrooms) {
		this.bathrooms = bathrooms;
	}
	public House(int id, double squareFeet, int bedrooms, int bathrooms) {
		super();
		this.id = id;
		this.squareFeet = squareFeet;
		this.bedrooms = bedrooms;
		this.bathrooms = bathrooms;
	}
	public House() {
		super();
	}
}
