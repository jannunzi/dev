package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

import edu.neu.cs5200.model.DeveloperPOJO;

public class InsertDocumentParams {

	public static void insert(String first, String last, int age) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		BasicDBObject doc =
				new BasicDBObject("first", first).
			            	append("last", last).
			                append("age", age);

		coll.insert(doc);
	}
	
	public static void main(String[] args) throws UnknownHostException {
		InsertDocumentParams.insert("Kate", "Winslet", 38);
	}
}
