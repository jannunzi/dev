package q4;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.util.Calendar;
import java.util.Date;

public class Main {

	public static void main(String[] args) {
				
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		
		long createdTripUserId = 0;
		
		Date today, later;
		java.sql.Date start, end;
		Calendar calendar = Calendar.getInstance();
		
		try { // [ /1] try catch
			// 1. Connect to a database using the following URL and credentials:
			//    jdbc:mysql://localhost/cs3200,
			//    com.mysql.jdbc.Driver, root, password123
			// [  /0.5] use the correct driver
			String driver = "com.mysql.jdbc.Driver";
			// [  /0.5] instantiate the driver
			Class.forName (driver).newInstance();
			// [  /0.5] use the correct url
			// [  /0.5] use the correct username
			// [  /0.5] use the correct password
			// [  /0.5] get a connection
			String url = "jdbc:mysql://localhost/cs3200";
			String username = "root";
			String password = "password123";
			connection = DriverManager.getConnection (url, username, password); // []
			
			// 2. Insert a user with username / password: danielgraig / password333
			// [  /1] correct SQL
			String insertDanielCraigSql = "INSERT INTO USER (ID, USERNAME, PASSWORD) VALUES (NULL, ?, ?)";
			// [  /0.5] use PreparedStatement instead of Statement
			// [  /0.5] use Statement.RETURN_GENERATED_KEYS
			statement = connection.prepareStatement(insertDanielCraigSql, Statement.RETURN_GENERATED_KEYS); // 
			// [  /2] configure fields
			statement.setString(1, "danielgraig");
			statement.setString(2, "password333");
			// [  /1] execute statement
			statement.executeUpdate();
			
			// 3. Using the ID of the user created in the previous step,
			//    insert a trip called ‘Plum Island’, starting today for 3 days
			// [  /1] get the keys from the statement
			// [  /0.5] into a result set
			results = statement.getGeneratedKeys();
			// [  /1] advance result set
			// [  /1] check if there are any rows
			// [  /1] get key from 1st field
			// [  /0.5] field is long
			if(results.next()) {
				createdTripUserId = results.getLong(1);
			}
			// don't take points off date operations
			today = calendar.getTime();
			calendar.add(Calendar.DATE, 3);
			later = calendar.getTime();
			start = new java.sql.Date(today.getTime());
			end   = new java.sql.Date(later.getTime());			
			// [  /1] correct SQL
			// [  /0.5] NULL for ID
			// [  /1] fields in the correct order
			// (field names are optional)
			String insertTripPlumIsland = "INSERT INTO TRIP (ID, NAME, STARTDATE, ENDDATE, CREATEDTRIPUSERID) VALUES (NULL, ?, ?, ?, ?)";
			// [  /0.5] get statement from connection
			// [  /0.5] use prepared statement instead of statement
			// [  /1] configure fields
			// [  /1] correct data type
			// [  /1] correct field order
			// [  /0.5] execute update or .execute()
			statement = connection.prepareStatement(insertTripPlumIsland);
			statement.setString(1, "Plum Island");
			statement.setDate(2, start); // dont grade
			statement.setDate(3, end); // dont grade
			statement.setLong(4, createdTripUserId);
			statement.executeUpdate(); // or .execute()
			
			// 4. Delete all flounder fish weighing less than 1 pound,
			//    where flounder is a species
			// [  /1] correct SQL
			// [  /0.5] get statement from connection
			// [  /0.5] use prepared statement instead of statement
			// [  /0.5] execute update or execute()
			String deleteAllFlounderFishWeighingLessThanOnePound = "DELETE FROM FISH WHERE SPECIES='FLOUNDER' AND WEIGHT<1";
			statement = connection.prepareStatement(deleteAllFlounderFishWeighingLessThanOnePound);
			statement.executeUpdate();
			
			// 5. Select trip whose id is 123 and display its name,
			//    start and end date
			// [  /1] correct SQL
			// [  /0.5] get statement from connection
			// [  /0.5] use prepared statement instead of statement
			// [  /0.5] execute query or execute()
			String selectTripWhoseIdIs123 = "SELECT FROM TRIP WHERE ID=123";
			statement = connection.prepareStatement(selectTripWhoseIdIs123);
			results = statement.executeQuery();
			// [  /1] next()
			// [  /1] if
			// [  /1] get fields
			// [  /1] print
			if(results.next()) {
				String name = results.getString("name");
				start = results.getDate("startDate");
				end = results.getDate("endDate");
				System.out.println("Trip Name: " + name);
				System.out.println("Start Date: " + start);
				System.out.println("End Date: " + end);
			}
			
			// 6. Select all the fish from a trip whose id is 123
			//    and iterate over the list of fish displaying all the attributes
			// [  /1] correct SQL
			// [  /0.5] statement from connection
			// [  /0.5] prepared statement instead of statement
			String selectAllFishFromTripWhoseIdIs123 = "SELECT FISH.* FROM FISH, TRIP WHERE FISH TRIPID=123";
			statement = connection.prepareStatement(selectAllFishFromTripWhoseIdIs123);
			results = statement.executeQuery();
			// [  /1] .next()
			// [  /1] while()
			while(results.next()) {
				// [  /2] get field values
				int id = results.getInt("id");
				String name = results.getString("name");
				float length = results.getFloat("length");
				float weight = results.getFloat("weight");
				String species = results.getString("species");
				java.sql.Date caught = results.getDate("caughtDate");
				int caughtByUserId = results.getInt("caughtByUserId");
				int tripId = results.getInt("tripId");
				// [  /2] print fields
				System.out.println("Id: " + id);
				System.out.println("Name: " + name);
				System.out.println("Length: " + length);
				System.out.println("Weight: " + weight);
				System.out.println("Species: " + species);
				System.out.println("Caught Date: " + caught);
				System.out.println("Caught By User ID: " + caughtByUserId);
				System.out.println("Trip ID: " + tripId);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// [  /1] close connection
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
