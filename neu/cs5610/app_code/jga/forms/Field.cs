using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using edu.neu.ccis.jga;

/// <summary>
/// Summary description for Field
/// </summary>
public class Field
{
	public Field()
	{
        Attribute name = new Attribute("name");
        Attribute value = new Attribute("value");
        Attribute id = new Attribute("id");
        Attribute htmlClass = new Attribute("class");
        Attribute style = new Attribute("style");
        attributes.Add(name);
        attributes.Add(id);
        attributes.Add(htmlClass);
        attributes.Add(style);
	}
    public Field(string name)
    {
        this.name = name;
    }
    List<Attribute> attributes { set; get; }
    public string name { set; get; }
    public static Field getRandomField(string name) {
        if(name == null)
            name = Utils.getRandomString(10);
        Field field = new Field(name);
        return field;
    }
}