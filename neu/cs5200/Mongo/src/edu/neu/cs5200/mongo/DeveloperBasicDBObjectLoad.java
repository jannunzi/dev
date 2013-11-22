package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

import edu.neu.cs5200.model.Developer;

public class DeveloperBasicDBObjectLoad {

	public static Developer load() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		DBCollection coll = db.getCollection("developers");
		
		DBObject developerDB = (DBObject) coll.findOne();
		Developer developer = new Developer(developerDB);
		
		return developer;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		Developer developer = DeveloperBasicDBObjectLoad.load();
		System.out.println(developer);
	}
}
