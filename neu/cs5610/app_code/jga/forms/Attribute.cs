using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Attribute
/// </summary>
public class Attribute
{
	public Attribute() : this("", "")
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Attribute(string name) : this(name, "")
    {
    }

    public Attribute(string name, string value)
    {
        this.name = name;
        this.value = value;
    }

    public string name { set; get; }
    public string value { set; get; }
}