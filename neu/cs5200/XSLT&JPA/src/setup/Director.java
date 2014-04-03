package setup;

import java.util.List;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

@Entity
@NamedQueries(value = { @NamedQuery(name = "findAllDirectors", query = "select dir from Director dir") })
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Director {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	@XmlAttribute
	private String firstName;
	@XmlAttribute
	private String lastName;
	@OneToMany(mappedBy="director", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="movie")
	private List<Movie> movies;
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
	public List<Movie> getMovies() {
		return movies;
	}
	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	public Director(String firstName, String lastName, List<Movie> movies) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.movies = movies;
	}
	public Director() {
		super();
	}
}
