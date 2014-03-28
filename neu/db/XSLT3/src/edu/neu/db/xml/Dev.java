package edu.neu.db.xml;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Dev {
	List<App> app;

	public List<App> getApp() {
		return app;
	}

	public void setApp(List<App> app) {
		this.app = app;
	}

	public Dev(List<App> app) {
		super();
		this.app = app;
	}

	public Dev() {
		super();
	}
	
}
