package jpa.sqlfirst.map;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the map database table.
 * 
 */
@Entity
@NamedQuery(name="Map.findAll", query="SELECT m FROM Map m")
public class Map implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	//bi-directional many-to-one association to Mapmany
	@ManyToOne
	@JoinColumn(name="manyId")
	private MapMany mapmany;

	//bi-directional many-to-one association to Mapone
	@ManyToOne
	@JoinColumn(name="oneId")
	private MapOne mapone;

	public Map() {
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

	public MapMany getMapmany() {
		return this.mapmany;
	}

	public void setMapmany(MapMany mapmany) {
		this.mapmany = mapmany;
	}

	public MapOne getMapone() {
		return this.mapone;
	}

	public void setMapone(MapOne mapone) {
		this.mapone = mapone;
	}

}