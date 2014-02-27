using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TripTO
{
	public TripTO() {}
    public TripTO(string name, DateTime start, DateTime end)
    {
        this.name = name;
        this.startDate = start;
        this.endDate = end;
    }
    public string name { set; get; }
    public DateTime startDate { set; get; }
    public DateTime endDate { set; get; }
}