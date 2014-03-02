using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fish360Project
{
    public class FishTO
    {
        public int id { set; get; }
        public string name { set; get; }
        public float weight { set; get; }
        public float length { set; get; }
        public string species { set; get; }
        public DateTime caughtDate { set; get; }

        public FishTO(int id, string name, float weight, float length, string species, DateTime caught)
        {
            this.id = id;
            this.name = name;
            this.weight = weight;
            this.length = length;
            this.species = species;
            this.caughtDate = caught;
        }
    }
}