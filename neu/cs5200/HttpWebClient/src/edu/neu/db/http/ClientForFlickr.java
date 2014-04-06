package edu.neu.db.http;

import java.io.*;
import java.net.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class ClientForFlickr {

	public void connectToFlick(String tags) {
		try {
			
			String method = "flickr.photos.search";
			String api_key = "5da2ddf6e55e6529b2c3211d124182ea";
			
			String urlString = "https://api.flickr.com/services/rest?";
			urlString += "method="+method;
			urlString += "&api_key="+api_key;
			urlString += "&tags="+tags;
			
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			InputStreamReader reader = new InputStreamReader(connection.getInputStream());
			BufferedReader buffer = new BufferedReader(reader);
			String output;
			while((output = buffer.readLine()) != null) {
				System.out.println(output);
			}
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void clientAgain() {
		try {
			URL url = new URL("https://api.flickr.com/services/rest?method=flickr.photos.search&api_key=5da2ddf6e55e6529b2c3211d124182ea&tags=legos");
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			
			
			JAXBContext jaxb = JAXBContext.newInstance(Rsp.class);
			Unmarshaller unmarshaller = jaxb.createUnmarshaller();
			Rsp rsp = (Rsp)unmarshaller.unmarshal(connection.getInputStream());
			
			for(Photo photo : rsp.photos.photo) {
				System.out.println(photo.getSrc());
			}
			
			/*
			InputStreamReader reader = new InputStreamReader(connection.getInputStream());
			BufferedReader buffer = new BufferedReader(reader);
			
			String line;
			
			while((line = buffer.readLine()) != null ) {
				System.out.println(line);
			}*/
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ClientForFlickr client = new ClientForFlickr();
//		client.connectToFlick("pears");
		client.clientAgain();
	}

}
