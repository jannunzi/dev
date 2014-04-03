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

public class FlickrClient2 {

	public Rsp connectToFlickr(String searchTerms)
	{
		Rsp rsp = new Rsp();
		
		String api_key = "5da2ddf6e55e6529b2c3211d124182ea";
		String urlString = "https://api.flickr.com/services/rest?";
		String method = "flickr.photos.search";
		String tags = searchTerms;
		urlString += "api_key="+api_key;
		urlString += "&method="+method;
		urlString += "&tags="+tags;
		
		try {
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			
			JAXBContext jaxb = JAXBContext.newInstance(Rsp.class);
			Unmarshaller unmarshaller = jaxb.createUnmarshaller();
			rsp = (Rsp) unmarshaller.unmarshal(connection.getInputStream());
/*			
			InputStreamReader reader = new InputStreamReader(connection.getInputStream());
			BufferedReader buffer = new BufferedReader(reader);
			
			String output;
			
			while((output = buffer.readLine()) != null) {
				System.out.println(output);
			}
	*/		
			connection.disconnect();
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
		return rsp;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FlickrClient2 c2 = new FlickrClient2();
		
		Rsp rsp = c2.connectToFlickr("star,wars");
		System.out.println(rsp);
		System.out.println(rsp.stat);
		List<Photo> photos = rsp.photos.photo;
		for(Photo photo : photos) {
			System.out.println(photo.title);
		}
	}

}
