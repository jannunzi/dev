package edu.neu.db.net.http.flickr;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class Client2 {
	public Rsp searchFlickr(String tags)
	{
		String api_key = "5da2ddf6e55e6529b2c3211d124182ea";
		String method = "flickr.photos.search";
		String urlString = "https://api.flickr.com/services/rest";
		
		urlString += "?api_key=" + api_key;
		urlString += "&tags=" + tags;
		urlString += "&method=" + method;

		System.out.println(urlString);
		
		Rsp rsp = null;
		
		try {
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			JAXBContext jaxb = JAXBContext.newInstance(Rsp.class);
			Unmarshaller unmarshaller = jaxb.createUnmarshaller();
			
			rsp = (Rsp) unmarshaller.unmarshal(connection.getInputStream());
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rsp;
	}
	public static void main(String[] args) {
		Client2 client = new Client2();
		Rsp rsp = client.searchFlickr("star,wars");
		System.out.println(rsp.stat);
		List<Photo> photos = rsp.photos.photo;
		for(Photo photo:photos)
		{
			System.out.println(photo.title);
			String url = "http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg";
			url = url.replace("{farm-id}", photo.farm);
			url = url.replace("{server-id}", photo.server);
			url = url.replace("{id}", photo.id);
			url = url.replace("{secret}", photo.secret);
			System.out.println(url);
		}
	}
}
