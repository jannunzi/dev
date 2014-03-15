package cs3200;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LikesManager {

	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet results = null;

	String createLikesSql = "INSERT INTO LIKES (USERNAME, ISBN, STARS, COMMENT, DATE) VALUES (?,?,?,?,?)";
	
	public void createLikes(Likes likes) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(createLikesSql);
			statement.setString(1, likes.getUsername());
			statement.setString(2, likes.getIsbn());
			statement.setInt(3, likes.getStars());
			statement.setString(4, likes.getComment());
			Date date = new Date(likes.getDate().getTime());
			statement.setDate(5, date);
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
	
	DataSource ds;
	public LikesManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/books");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
