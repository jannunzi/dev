package setup;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

@Entity
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Actor {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	@XmlAttribute
	private String firstName;
	@XmlAttribute
	private String lastName;
	@XmlAttribute
	private int oscars;
	@ManyToOne
	@JoinColumn(name="movieId")
	@XmlTransient
	private Movie movie;
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
	public int getOscars() {
		return oscars;
	}
	public void setOscars(int oscars) {
		this.oscars = oscars;
	}
	public Actor(String firstName, String lastName, int oscars, Movie movie) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.oscars = oscars;
		this.movie = movie;
	}
	public Actor() {
		super();
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
}
