package edu.neu.db.xslt.developer;

import java.io.File;
import java.util.Date;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class DevJaxB 
{
	public void serializeApplication(Application app, String fileName)
	{
		File file = new File(fileName);
		try {
			JAXBContext jaxContext = JAXBContext.newInstance(Application.class);
			Marshaller jaxMarshaller = jaxContext.createMarshaller();
			jaxMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			jaxMarshaller.marshal(app, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) 
	{
		DevJaxB jax = new DevJaxB();
		
		Application app = new Application(123, "Word", "Productivity", new Date());
		jax.serializeApplication(app, "developers/app.xml");		
	}
}
