package jdbchw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbchw.Book;

public class BookManager {

	DataSource ds;
	Connection connection;
	PreparedStatement statement;
	ResultSet results;
	
	String createBookSql = "INSERT INTO BOOK (ID, TITLE) VALUES (NULL, ?);";
	String listAllBooksSql = "SELECT * FROM BOOK";

	public List<Book> listAllBooks() {
		List<Book> books = new ArrayList<Book>();
		
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(listAllBooksSql);
			results = statement.executeQuery();
			while(results.next()) {
				Book book = new Book();
				book.setId(results.getInt("id"));
				book.setTitle(results.getString("title"));
				books.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return books;
	}
	
	public void createBook(Book b) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(createBookSql);
			statement.setString(1, b.getTitle());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	public BookManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/JPACodeFirstClass");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BookManager bm = new BookManager();
		Book book = new Book(123, "The Lord of The Rings");
		bm.createBook(book);
	}

}
