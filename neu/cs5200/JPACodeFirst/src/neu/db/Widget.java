package neu.db;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Widget
 *
 */
@Entity

public class Widget implements Serializable {

	   
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int width;
	private int height;
	private String name;
	private static final long serialVersionUID = 1L;

	public Widget() {
		super();
	}   
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}   
	public int getWidth() {
		return this.width;
	}

	public void setWidth(int width) {
		this.width = width;
	}   
	public int getHeight() {
		return this.height;
	}

	public void setHeight(int height) {
		this.height = height;
	}   
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
   
}
