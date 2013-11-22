package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class GetCollection {

	public static DBCollection getCollection(String name) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection(name);
		
		return coll;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		System.out.println(GetCollection.getCollection("developers"));
	}
}
