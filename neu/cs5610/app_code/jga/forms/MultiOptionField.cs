using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Select
/// </summary>
public class MultiOptionField : Field
{
	public MultiOptionField()
	{
        Option option1 = new Option("Option 1");
        Option option2 = new Option("Option 2");
        Option option3 = new Option("Option 3");
        options.Add(option1);
        options.Add(option2);
        options.Add(option3);
    }
    public MultiOptionField(List<Option> options) { this.options = options; }

    protected List<Option> options { set; get; }
}