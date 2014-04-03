package com.atc.siterra.bup.model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Column {
	@XmlAttribute
	public String name;
	@XmlAttribute
	public int type;
	@XmlAttribute
	public int size;
}
