package edu.neu.db.xml;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class DeveloperMgr
{
	public Developer parseDeveloperFromFile(String fileName)
	{
		Developer developer = null;
		
		File file = new File(fileName);
		
		try {
			JAXBContext context = JAXBContext.newInstance(Developer.class);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			developer = (Developer) unmarshaller.unmarshal(file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return developer;
	}
	
	public void createDeveloperXmlFileFromJava(Developer developer, String fileName)
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
	
	public void convertDeveloperToDev(String fromFileName, String toFileName)
	{
		File fromFile = new File(fromFileName);
		File toFile   = new File(toFileName);
		
		Developer developer = this.parseDeveloperFromFile(fromFileName);

		System.out.println(developer.getFirstName());
		
		List<App> apps = new ArrayList<App>();
		
		for(Application application : developer.getApplication())
		{
			App ap = new App();
			ap.setNombre(application.getName());
			ap.setPrecio(application.getPrice());
			apps.add(ap);
		}
		
		Dev dev = new Dev();
		dev.setApp(apps);

		try {
			JAXBContext context = JAXBContext.newInstance(Dev.class);
			Marshaller marsh = context.createMarshaller();
			marsh.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marsh.marshal(dev, toFile);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public static void main(String[] args)
	{
		DeveloperMgr mgr = new DeveloperMgr();
		
		Developer dev = mgr.parseDeveloperFromFile("developers/bob.xml");
		if(dev != null)
		{
			System.out.println(dev.getFirstName());
			System.out.println(dev.getLastName());
			System.out.println(dev.getSalary());
			List<Application> bobApps = dev.getApplication();
			for(Application a : bobApps) {
				System.out.println(a.getName());
				System.out.println(a.getPrice());
			}
		}
		else
		{
			System.out.println("Oops, developer not found");
		}
		
		Developer bob = new Developer("Bob", "Marley", 123321);
		
		Application keynote = new Application("KeyNote", 0.0);
		Application word    = new Application("Word", 99.0);
		
		List<Application> apps = new ArrayList<Application>();
		apps.add(keynote);
		apps.add(word);
		
		bob.setApplication(apps);
		mgr.createDeveloperXmlFileFromJava(bob, "developers/bob.xml");
		
		
		mgr.convertDeveloperToDev("developers/bob.xml", "developers/roberto.xml");
	}
}
