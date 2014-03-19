package jpa.sqlfirst.onetomany;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the one database table.
 * 
 */
@Entity
@NamedQuery(name="One.findAll", query="SELECT o FROM One o")
public class One implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.DATE)
	private Date date;

	private String name;

	//bi-directional many-to-one association to Many
	@OneToMany(mappedBy="one")
	private List<Many> manies;

	public One() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Many> getManies() {
		return this.manies;
	}

	public void setManies(List<Many> manies) {
		this.manies = manies;
	}

	public Many addMany(Many many) {
		getManies().add(many);
		many.setOne(this);

		return many;
	}

	public Many removeMany(Many many) {
		getManies().remove(many);
		many.setOne(null);

		return many;
	}

}