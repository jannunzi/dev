package edu.neu.db.net.http.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class GizmodoHttpClient {
	public void connectToGizmodo() {
		try {
			URL url = new URL("http://gizmodo.com");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(connection.getInputStream());
			BufferedReader buffer = new BufferedReader(reader);
			String output;
			while((output = buffer.readLine()) != null)
			{
				System.out.println(output);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		GizmodoHttpClient client = new GizmodoHttpClient();
		client.connectToGizmodo();
	}
}
