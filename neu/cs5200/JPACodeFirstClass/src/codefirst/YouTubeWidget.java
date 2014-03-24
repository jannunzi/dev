package codefirst;

import javax.persistence.Entity;

@Entity
public class YouTubeWidget extends Widget {
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
