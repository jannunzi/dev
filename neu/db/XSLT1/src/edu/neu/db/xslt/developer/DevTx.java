package edu.neu.db.xslt.developer;

import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;

import java.io.File;

public class DevTx 
{
	public void transform(String inputFileName, String xsltFileName, String outputFileName)
	{
		Source input = new StreamSource(new File(inputFileName));
		Source xslt  = new StreamSource(new File(xsltFileName));
		StreamResult output = new StreamResult(new File(outputFileName));
		
		TransformerFactory factory = TransformerFactory.newInstance();
		try {
			Transformer tx = factory.newTransformer(xslt);
			tx.transform(input, output);
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
		tx.transform("developers/developers.xml", "developers/html.xslt", "developers/developers.html");
	}
}
