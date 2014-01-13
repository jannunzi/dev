using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Select
/// </summary>
public class Select : MultiOptionField
{
	public Select() : base()
	{
    }
    public Select(List<Option> options) : base(options) { }
}