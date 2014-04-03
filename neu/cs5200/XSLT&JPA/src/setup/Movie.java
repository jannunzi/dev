package setup;

import java.util.List;

import javax.persistence.*;
import javax.xml.bind.annotation.*;

@Entity
@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class Movie {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@XmlAttribute
	private int id;
	@XmlAttribute
	private String name;
	@XmlAttribute
	private int stars;
	@OneToMany(mappedBy="movie", cascade=CascadeType.ALL, orphanRemoval=true)
	@XmlElement(name="actor")
	private List<Actor> actors;
	@ManyToOne
	@JoinColumn(name="directorId")
	@XmlTransient
	private Director director;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public List<Actor> getActors() {
		return actors;
	}
	public void setActors(List<Actor> actors) {
		this.actors = actors;
	}
	public Movie(String name, int stars, List<Actor> actors, Director director) {
		super();
		this.name = name;
		this.stars = stars;
		this.actors = actors;
		this.director = director;
	}
	public Movie() {
		super();
	}
	public Director getDirector() {
		return director;
	}
	public void setDirector(Director director) {
		this.director = director;
	}
}
