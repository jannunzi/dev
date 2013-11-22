package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.*;

public class GetDatabase {

	public static DB getDB() throws UnknownHostException {
		Mongo mongoClient = new Mongo( "localhost" , 27017 );
		DB db = mongoClient.getDB("developers");
		return db;
	}
	
	public static void main(String[] args) throws UnknownHostException {
		System.out.println(GetDatabase.getDB());
	}
}
