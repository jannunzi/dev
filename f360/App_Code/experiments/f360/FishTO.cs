using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class FishTO
{
	public FishTO()	{}
    public FishTO(string name,
        float length,
        float weight,
        DateTime caught,
        string species)
    {
        this.name = name;
        this.length = length;
        this.weight = weight;
        this.caughtDate = caughtDate;
        this.species = species;
    }
    public string name { set; get; }
    public float length { set; get; }
    public float weight { set; get; }
    public DateTime caughtDate { set; get; }
    public string species { set; get; }
}