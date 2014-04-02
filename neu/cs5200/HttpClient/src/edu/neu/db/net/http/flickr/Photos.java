package edu.neu.db.net.http.flickr;

import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Photos {
	@XmlAttribute
	String page="1";
	@XmlAttribute
	String pages="18982";
	@XmlAttribute
	String perpage="100";
	@XmlAttribute
	String total="1898168";
	@XmlElement
	List<Photo> photo;
}
