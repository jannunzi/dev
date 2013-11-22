package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class FindFiltered {

	public static DBCursor find() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		BasicDBObject query = new BasicDBObject("age", 45);
		DBCursor cursor = coll.find(query);

		return cursor;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DBCursor cursor = FindFiltered.find();
		while(cursor.hasNext()){
			System.out.println(cursor.next());
		}
	}
}
