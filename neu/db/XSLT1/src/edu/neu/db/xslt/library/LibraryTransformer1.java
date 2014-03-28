package edu.neu.db.xslt.library;

import java.io.File;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class LibraryTransformer1 
{
	public void transform(String xsltFileName, String inputFileName, String outputFileName) 
	{
		Source xslt = new StreamSource(new File(xsltFileName));
		Source input = new StreamSource(new File(inputFileName));
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
		LibraryTransformer1 tx = new LibraryTransformer1();
		tx.transform("library/Library1All.xslt", "library/LibraryData.xml", "library/LibraryOut.html");
	}
}
