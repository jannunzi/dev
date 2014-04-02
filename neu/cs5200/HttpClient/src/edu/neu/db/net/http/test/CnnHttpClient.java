package edu.neu.db.net.http.test;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class CnnHttpClient
{
	public void connectTo(String urlStr)
	{
		URL url;
		try
		{
			url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			InputStreamReader inputStream = new InputStreamReader(conn.getInputStream());
			BufferedReader bufferedReader = new BufferedReader(inputStream);
			String output = null;
			while ((output = bufferedReader.readLine()) != null)
			{
				System.out.println(output);
			}
			conn.disconnect();
		}
		catch (MalformedURLException e) 
		{
			e.printStackTrace();
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
	public static void main(String[] args)
	{
		CnnHttpClient client = new CnnHttpClient();
		client.connectTo("http://cnn.com");
	}
}
