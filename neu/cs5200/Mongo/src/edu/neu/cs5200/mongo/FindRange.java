package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class FindRange {

	public static DBCursor find() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");

		BasicDBObject ageGt40 = new BasicDBObject("$gt", 40);
		BasicDBObject ageLt60 = new BasicDBObject("$lt", 60);
		BasicDBObject query = new BasicDBObject("age", ageLt60).append("age", ageLt60);
		System.out.println(ageGt40);
		System.out.println(ageLt60);
		System.out.println(query);
		DBCursor cursor = coll.find(query);

		return cursor;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DBCursor cursor = FindRange.find();
		while(cursor.hasNext()){
			System.out.println(cursor.next());
		}
	}
}
