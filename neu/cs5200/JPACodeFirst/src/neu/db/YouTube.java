package neu.db;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: YouTube
 *
 */
@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public class YouTube extends Widget implements Serializable {
	
	private String url;
	private static final long serialVersionUID = 1L;

	public YouTube() {
		super();
	}   
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
   
}
