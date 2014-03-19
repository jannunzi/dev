package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the table123 database table.
 * 
 */
@Entity
@NamedQuery(name="Table123.findAll", query="SELECT t FROM Table123 t")
public class Table123 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	public Table123() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}