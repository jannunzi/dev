package cs5200;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MovieManager {
	
	Connection connection;
	PreparedStatement statement;
	ResultSet results;
	
	String createMovieSql = "INSERT INTO MOVIE (ID, TITLE, THUMBNAIL) VALUES (?,?,?);";
	
	public void createMovie(Movie movie) {
		try {
			connection = ds.getConnection();
			statement = connection.prepareStatement(createMovieSql);
			int count = statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	DataSource ds;
	public MovieManager() {
		try {
			Context jndi = new InitialContext();
			ds = (DataSource) jndi.lookup("java:comp/env/jdbc/movies");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
