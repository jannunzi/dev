package edu.neu.db.xslt;

import java.io.File;

import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;

public class Jeep2Fiat
{
	public void convert(String inputFileName, String outputFileName, String xsltFileName)
	{
		File inputFile  = new File(inputFileName);
		File outputFile = new File(outputFileName);
		File xsltFile   = new File(xsltFileName);
		
		StreamSource inputSrc  = new StreamSource(inputFile);
		StreamSource xsltSrc   = new StreamSource(xsltFile);
		StreamResult outputStr = new StreamResult(outputFile);
		
		TransformerFactory factory = TransformerFactory.newInstance();
		try {
			Transformer tx = factory.newTransformer(xsltSrc);
			tx.transform(inputSrc, outputStr);
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
		Jeep2Fiat j2f = new Jeep2Fiat();
		j2f.convert("jeep2fiat/jeep.xml", "jeep2fiat/fiat.xml", "jeep2fiat/j2f.xslt");
		j2f.convert("jeep2fiat/jeep.xml", "jeep2fiat/fiat.html", "jeep2fiat/j2f_html.xslt");
	}
}
