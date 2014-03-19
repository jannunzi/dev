package cs3200;

import java.util.Date;

public class Likes {
	protected String username;
	protected String isbn;
	protected int stars;
	protected String comment;
	protected Date date;
	public Likes(String username, String isbn, int stars, String comment,
			Date date) {
		super();
		this.username = username;
		this.isbn = isbn;
		this.stars = stars;
		this.comment = comment;
		this.date = date;
	}
	public Likes(){}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
