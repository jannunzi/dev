package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class Find {

	public static DBCursor all() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		DBCursor cursor = coll.find();

		return cursor;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DBCursor cursor = Find.all();
		while(cursor.hasNext()){
			System.out.println(cursor.next());
		}
	}
}
