package neu.db;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Review
 *
 */
@Entity

public class Review implements Serializable {

	   
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String comment;
	private int stars;
	private Developer reviewedBy;
	private Application application;
	private static final long serialVersionUID = 1L;

	public Review() {
		super();
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}   
	public int getStars() {
		return this.stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	public Developer getReviewedBy() {
		return reviewedBy;
	}
	public void setReviewedBy(Developer reviewedBy) {
		this.reviewedBy = reviewedBy;
	}
   
}
