package jpa.sqlfirst.map;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the mapmany database table.
 * 
 */
@Entity
@NamedQuery(name="MapMany.findAll", query="SELECT m FROM MapMany m")
public class MapMany implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	//bi-directional many-to-one association to Map
	@OneToMany(mappedBy="mapmany")
	private List<Map> maps;

	public MapMany() {
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

	public List<Map> getMaps() {
		return this.maps;
	}

	public void setMaps(List<Map> maps) {
		this.maps = maps;
	}

	public Map addMap(Map map) {
		getMaps().add(map);
		map.setMapmany(this);

		return map;
	}

	public Map removeMap(Map map) {
		getMaps().remove(map);
		map.setMapmany(null);

		return map;
	}

	public String toString() {
		return id + " " + name;
	}
}