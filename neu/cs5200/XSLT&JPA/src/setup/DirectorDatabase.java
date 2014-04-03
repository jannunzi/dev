package setup;

import java.util.List;

import javax.xml.bind.annotation.*;

@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
public class DirectorDatabase {
	@XmlElement(name="director")
	private List<Director> directors;

	public List<Director> getDirectors() {
		return directors;
	}
	public void setDirectors(List<Director> directors) {
		this.directors = directors;
	}
	public DirectorDatabase(List<Director> directors) {
		super();
		this.directors = directors;
	}
	public DirectorDatabase() {
		super();
	}
}
