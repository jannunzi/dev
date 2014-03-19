package jpa.sqlfirst.onetomany;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the many database table.
 * 
 */
@Entity
@NamedQuery(name="Many.findAll", query="SELECT m FROM Many m")
public class Many implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.DATE)
	private Date date;

	private String name;

	//bi-directional many-to-one association to One
	@ManyToOne
	@JoinColumn(name="oneId")
	private One one;

	public Many() {
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

	public One getOne() {
		return this.one;
	}

	public void setOne(One one) {
		this.one = one;
	}

}