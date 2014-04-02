package edu.neu.db.net.http.flickr;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Rsp {
	@XmlAttribute
	public String stat="ok";
	public Photos photos;
}
