package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

import edu.neu.cs5200.model.DeveloperPOJO;

public class InsertDocumentObject {

	public static void insert(DeveloperPOJO d) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		BasicDBObject doc =
				new BasicDBObject("first", d.first).
			            	append("last", d.last).
			                append("age", d.age);

		coll.insert(doc);
	}
	
	public static void main(String[] args) throws UnknownHostException {
		DeveloperPOJO dev = new DeveloperPOJO("Issac", "Asimov", 72);
		InsertDocumentObject.insert(dev);
	}
}
