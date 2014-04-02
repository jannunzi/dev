package edu.neu.db.net.http.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class WikipediaHttpClient
{
	public void connectToWikipedia()
	{
		try {
			URL url = new URL("http://wikipedia.org");
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			
			InputStreamReader reader = new InputStreamReader(connection.getInputStream());
			BufferedReader buffer = new BufferedReader(reader);
			String output;
			while((output = buffer.readLine()) != null)
			{
				System.out.println(output);
			}
			
			connection.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args)
	{
		WikipediaHttpClient client = new WikipediaHttpClient();
		client.connectToWikipedia();
	}
}
