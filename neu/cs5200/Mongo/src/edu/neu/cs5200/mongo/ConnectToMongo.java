package edu.neu.cs5200.mongo;

import java.net.UnknownHostException;

import com.mongodb.*;

public class ConnectToMongo {

	public static Mongo connect() throws UnknownHostException {
		Mongo mongoClient = new Mongo();
		return mongoClient;
	}
	public static void main(String[] args) throws UnknownHostException {
		System.out.println(ConnectToMongo.connect());
	}
}
