package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class Count {

	public static long count(String collectionName) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection(collectionName);
		
		return coll.getCount();
	}
	
	public static void main(String[] args) throws UnknownHostException {
		long count = Count.count("developers");
		System.out.println(count);
	}
}
