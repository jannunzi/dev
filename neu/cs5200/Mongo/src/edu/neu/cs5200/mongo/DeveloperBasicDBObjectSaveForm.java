package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

import edu.neu.cs5200.model.Developer;

public class DeveloperBasicDBObjectSaveForm {

	public static void insert(Developer developer) throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
				
		coll.save(developer);
	}
	
	public static void main(String[] args) throws UnknownHostException {
		Developer developer = 
				new Developer("Nicoletta", "Braschi", 50);
		DeveloperBasicDBObjectSaveForm.insert(developer);
	}
}
