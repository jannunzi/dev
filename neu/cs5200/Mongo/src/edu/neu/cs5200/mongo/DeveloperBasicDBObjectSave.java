package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

import edu.neu.cs5200.model.Developer;

public class DeveloperBasicDBObjectSave {

	public static void insert() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		Developer developer = 
				new Developer("Oscar", "Wilde", 50);
		
		coll.save(developer);

	}
	
	public static void main(String[] args) throws UnknownHostException {
		DeveloperBasicDBObjectSave.insert();
	}
}
