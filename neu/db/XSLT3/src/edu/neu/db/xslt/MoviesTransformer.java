package edu.neu.db.xslt;

import java.io.File;

import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;

public class MoviesTransformer
{
	public void transform(String inputFileName, String outputFileName, String transformFileName)
	{
		File inputFile = new File(inputFileName);
		File outputFile = new File(outputFileName);
		File txFile = new File(transformFileName);
		
		StreamSource inputSrc = new StreamSource(inputFile);
		StreamSource txSrc = new StreamSource(txFile);
		StreamResult resultSrc = new StreamResult(outputFile);
		
		TransformerFactory factory = TransformerFactory.newInstance();
		try {
			Transformer tx = factory.newTransformer(txSrc);
			tx.transform(inputSrc, resultSrc);
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
		MoviesTransformer transformer = new MoviesTransformer();
		transformer.transform("movies/movies.xml", "movies/movies.html", "movies/movies.xslt");
	}
}
