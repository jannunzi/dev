package edu.neu.db.xml;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;


public class DevMgr {

	public void marshallDeveloper(Developer dev, String fileName)
	{
		File file = new File(fileName);
		
		try {
			JAXBContext context = JAXBContext.newInstance(Developer.class);
			Marshaller marshaller = context.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.marshal(dev, file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Developer unmarshallDeveloper(String fileName)
	{
		File file = new File(fileName);
		
		Developer d = null;
		
		try {
			JAXBContext context = JAXBContext.newInstance(Developer.class);
			Unmarshaller marshaller = context.createUnmarshaller();
			d = (Developer) marshaller.unmarshal(file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}
	
	public static void main(String[] args) {
		
		DevMgr dao = new DevMgr();
		
		Application app1 = new Application();
		app1.name = "App1";
		app1.price = 123.45;
		
		Application app2 = new Application();
		app2.name = "App3";
		app2.price = 234.45;
		
		List<Application> apps = new ArrayList<Application>();
		apps.add(app1);
		apps.add(app2);

		Developer dev1 = new Developer();
		dev1.firstName = "Leonardo";
		dev1.lastName  = "DaVinci";
		dev1.salary    = 1000000;
		dev1.application = apps;
		
		dao.marshallDeveloper(dev1, "developers/leonardo.xml");
		
		
		Developer l2 = dao.unmarshallDeveloper("developers/leonardo2.xml");
		System.out.println(l2.firstName);
		System.out.println(l2.lastName);
		System.out.println(l2.salary);
		for(Application a : l2.application) {
			System.out.println(a.name);
			System.out.println(a.price);
		}
	}

}
