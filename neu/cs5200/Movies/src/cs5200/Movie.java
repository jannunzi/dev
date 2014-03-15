package cs5200;

public class Movie {
	String id;
	String title;
	String thumbnail;
	public Movie(){}
	public Movie(String id, String title, String thumbnail) {
		this.id = id;
		this.title = title;
		this.thumbnail = thumbnail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
}
