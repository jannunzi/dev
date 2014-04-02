package edu.neu.db.net.http;

import java.io.File;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class RspDao {

	public Rsp parseRsp(String fileName) {
		Rsp rsp = null;
		
		File file = new File(fileName);
		
		try {
			JAXBContext jax = JAXBContext.newInstance(Rsp.class);
			Unmarshaller unmarshaller = jax.createUnmarshaller();
			rsp = (Rsp) unmarshaller.unmarshal(file);
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rsp;
	}
	public static void main(String[] args) {
		RspDao dao = new RspDao();
		Rsp rsp = dao.parseRsp("flickr/photos.xml");
		System.out.println(rsp.stat);
		System.out.println(rsp.photos.page);
		System.out.println(rsp.photos.photo);
		
		List<Photo> photos = rsp.photos.photo;
		if(photos != null)
		{
			for(Photo photo:photos)
			{
				System.out.println(photo.title);
			}
		}
	}
}
