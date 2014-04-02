package edu.neu.db.http;

import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Photos {
	@XmlAttribute
	public String page="1";
	@XmlAttribute
	public String pages="18982";
	@XmlAttribute
	public String perpage="100";
	@XmlAttribute
	public String total="1898168";
	@XmlElement
	public List<Photo> photo;
}
