package edu.neu.db.xslt.devs;

import java.io.File;

import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;

public class DevTx 
{
	public void tx(String inputFileName, String outputFileName, String xsltFileName)
	{
		StreamSource input = new StreamSource(new File(inputFileName));
		StreamSource xslt  = new StreamSource(new File(xsltFileName));
		StreamResult output = new StreamResult(new File(outputFileName));
		
		TransformerFactory factory = TransformerFactory.newInstance();
		try {
			Transformer transformer = factory.newTransformer(xslt);
			transformer.transform(input, output);
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) 
	{
		DevTx tx = new DevTx();
		
		tx.tx("developers/developers.xml", "developers/developers.html", "developers/transform.xslt");
	}
}
