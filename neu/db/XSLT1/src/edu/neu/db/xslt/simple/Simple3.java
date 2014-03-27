package edu.neu.db.xslt.simple;

import java.io.File;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Simple3
{
	public static void main(String[] args) throws TransformerException
	{
        TransformerFactory factory = TransformerFactory.newInstance();
        Source xslt = new StreamSource(new File("simple/simple3.xslt"));
        Transformer transformer = factory.newTransformer(xslt);

        Source text = new StreamSource(new File("simple/simple1.xml"));
        transformer.transform(text, new StreamResult(new File("simple/simple3.output.xml")));
	}

}
