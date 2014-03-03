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
        public double weight { set; get; }
        public double length { set; get; }
        public string species { set; get; }
        public string caughtDate { set; get; }
        public int tripId { set; get; }

        public FishTO() { }
        public FishTO(int id, int tripId, string name, double weight, double length, string species, string caught)
        {
            this.id = id;
            this.tripId = tripId;
            this.name = name;
            this.weight = weight;
            this.length = length;
            this.species = species;
            this.caughtDate = caught;
        }

        public FishTO(int id, int tripId, string name, double weight, double length, string species, DateTime caught)
            : this(id, tripId, name, weight, length, species, caught.ToString("yyyy-MM-dd"))
        {}
    }
}