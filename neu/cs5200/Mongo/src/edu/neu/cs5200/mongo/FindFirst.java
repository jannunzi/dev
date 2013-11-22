package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class FindFirst {

	public static DBObject first() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		DBObject myDoc = coll.findOne();

		return myDoc;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DBObject myDoc = FindFirst.first();
		System.out.println(myDoc);
	}
}
