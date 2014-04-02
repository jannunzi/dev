package edu.neu.db.http;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Photo {
	@XmlAttribute
	public String id="13572128725";
	@XmlAttribute
	public String owner="75447720@N02";
	@XmlAttribute
	public String secret="ec87793667";
	@XmlAttribute
	public String server="3692";
	@XmlAttribute
	public String farm="4";
	@XmlAttribute
	public String title="LEGO FOR SALE!";
	@XmlAttribute
	public String ispublic="1";
	@XmlAttribute
	public String isfriend="0";
	@XmlAttribute
	public String isfamily="0";
	public String getSrc() {
		String url = "http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_m.jpg";
		url = url.replace("{farm-id}", this.farm);
		url = url.replace("{server-id}", this.server);
		url = url.replace("{id}", this.id);
		url = url.replace("{secret}", this.secret);
		return url;
	}
}
