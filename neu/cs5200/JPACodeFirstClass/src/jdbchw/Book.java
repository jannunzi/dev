package jdbchw;

public class Book {
	int id;
	String title;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Book(int id, String title) {
		super();
		this.id = id;
		this.title = title;
	}
	public Book(){}
}
