package edu.neu.db.xslt.library;

import java.io.File;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class LibraryTransformer
{
	TransformerFactory factory = TransformerFactory.newInstance();
	public void transform(String inputFileName, String xsltFileName, String outputFileName)
	{
		Source xslt = new StreamSource(new File(xsltFileName));
		Source input = new StreamSource(new File(inputFileName));
		StreamResult output =new StreamResult(new File(outputFileName));
		
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
	public static void main(String[] args) throws TransformerException
	{		
		LibraryTransformer tx = new LibraryTransformer();
		
		tx.transform("library/LibraryData.xml", "library/Library1All.xslt", "library/Library1All.html");
		tx.transform("library/LibraryData.xml", "library/Library2Match.xslt", "library/Library2Match.html");
		tx.transform("library/LibraryData.xml", "library/Library3ValueOf.xslt", "library/Library3ValueOf.html");
		tx.transform("library/LibraryData.xml", "library/Library4ForEach.xslt", "library/Library4ForEach.html");
		tx.transform("library/LibraryData.xml", "library/Library5Sort.xslt", "library/Library5Sort.html");
		tx.transform("library/LibraryData.xml", "library/Library6If.xslt", "library/Library6If.html");
		tx.transform("library/LibraryData.xml", "library/Library7Choose.xslt", "library/Library7Choose.html");
		tx.transform("library/LibraryData.xml", "library/Library8Apply.xslt", "library/Library8Apply.html");

		/*
        // get the files
		Source xslt = new StreamSource(new File("library/Library1All.xslt"));
        Source input = new StreamSource(new File("library/LibraryData.xml"));
        StreamResult output = new StreamResult(new File("library/Library1All.html"));
        
        // create the transformer
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(xslt);
        
        // perform the transformation
        transformer.transform(input, output);
        */
	}

}
