package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class FindRangeForm {

	public static DBCursor find(int min, int max) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		BasicDBObject query = new BasicDBObject("age",
				new BasicDBObject("$gt", min))
				.append("age", new BasicDBObject("$lt", max));
		
		DBCursor cursor = coll.find(query);

		return cursor;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DBCursor cursor = FindRangeForm.find(50, 70);
		while(cursor.hasNext()){
			System.out.println(cursor.next());
		}
	}
}
