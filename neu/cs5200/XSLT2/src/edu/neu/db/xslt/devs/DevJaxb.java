package edu.neu.db.xslt.devs;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class DevJaxb
{
	public void txApplications(Application application, String fileName)
	{
		File file = new File(fileName);
		try {
			JAXBContext context = JAXBContext.newInstance(Application.class);
			Marshaller marshaller = context.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.marshal(application, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void txDeveloper(Developer developer, String fileName)
	{
		File file = new File(fileName);
		try {
			JAXBContext context = JAXBContext.newInstance(Developer.class);
			Marshaller marshaller = context.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.marshal(developer, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Application unTxApplication(String fileName)
	{
		File file = new File(fileName);
		try {
			JAXBContext context = JAXBContext.newInstance(Application.class);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			Application app = (Application) unmarshaller.unmarshal(file);
			return app;
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Developer unTxDeveloper(String fileName)
	{
		File file = new File(fileName);
		try {
			JAXBContext context = JAXBContext.newInstance(Developer.class);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			Developer dev = (Developer) unmarshaller.unmarshal(file);
			return dev;
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) 
	{
		DevJaxb jax = new DevJaxb();
		
		Application app1 = new Application(123, "App1");
		Application app2 = new Application(234, "App2");
		Application app3 = new Application(345, "App3");
		Application app4 = new Application(456, "App4");
		Application app5 = new Application(567, "App5");
		Application app6 = new Application(678, "App6");
		jax.txApplications(app1, "developers/app1.xml");
		
		List<Application> apps = new ArrayList<Application>();
		apps.add(app1);
		apps.add(app2);
		apps.add(app3);
		apps.add(app4);
		apps.add(app5);
		apps.add(app6);
		
		Developer alice = new Developer(321, "Alice", apps);
		jax.txDeveloper(alice, "developers/alice.xml");
		
		Application app = jax.unTxApplication("developers/app1.xml");
		System.out.println(app.getName());
		
		Developer dev = jax.unTxDeveloper("developers/alice.xml");
		apps = dev.getApplication();
		for(Application app321 : apps) {
			System.out.println(app321.getName());
		}
	}
}
