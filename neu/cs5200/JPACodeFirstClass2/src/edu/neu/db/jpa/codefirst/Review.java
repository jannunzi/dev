package edu.neu.db.jpa.codefirst;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Review {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String comments;
	private int stars;
	
	private Author reviewer;
	private Book   reviewed;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public Author getReviewer() {
		return reviewer;
	}
	public void setReviewer(Author reviewer) {
		this.reviewer = reviewer;
	}
	public Book getReviewed() {
		return reviewed;
	}
	public void setReviewed(Book reviewed) {
		this.reviewed = reviewed;
	}
	public Review(int id, String comments, int stars, Author reviewer,
			Book reviewed) {
		super();
		this.id = id;
		this.comments = comments;
		this.stars = stars;
		this.reviewer = reviewer;
		this.reviewed = reviewed;
	}
	public Review() {
		super();
	}
}
