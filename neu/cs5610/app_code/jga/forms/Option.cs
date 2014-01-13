using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Option
/// </summary>
public class Option
{
	public Option() : this("", "") { }
    public Option(string value) : this(value, value) { }
    public Option(string value, string label)
    {
        this.value = value;
        this.label = label;
    }

    public string label { set; get; }
    public string value { set; get; }
}