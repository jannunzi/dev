package edu.neu.db.xslt.library;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;

import java.io.File;

public class LibTx
{
	public void tx(String inputFileName, String xsltFileName, String outputFileName)
	{
		Source xslt = new StreamSource(new File(xsltFileName));
		Source input = new StreamSource(new File(inputFileName));
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
		LibTx tx = new LibTx();
		tx.tx("library/input.xml", "library/tx.xslt", "library/output.html");
		tx.tx("library/A.xml", "library/A.xslt", "library/A.html");
		tx.tx("library/A.xml", "library/B.xslt", "library/B.html");
		tx.tx("library/A.xml", "library/C-foreach.xslt", "library/C-foreach.html");
		tx.tx("library/A.xml", "library/D-sort.xslt", "library/D-sort.html");
		tx.tx("library/A.xml", "library/E-if.xslt", "library/E-if.html");
		tx.tx("library/A.xml", "library/F-choose.xslt", "library/F-choose.html");
		tx.tx("library/A.xml", "library/G-applytemplates.xslt", "library/G-applytemplates.html");
	}
}
