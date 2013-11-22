package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class ListCollections {

	public static Set<String> list() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		Set<String> collections = db.getCollectionNames();
		return collections;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		Set<String> collections = ListCollections.list();
		for(String collectionName : collections)
			System.out.println(collectionName);
	}
}
