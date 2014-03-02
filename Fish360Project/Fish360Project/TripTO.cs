using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fish360Project
{
    public class TripTO
    {
        public int id { set; get; }
        public string name { set; get; }
        public string startDate { set; get; }
        public string endDate { set; get; }
        public List<FishTO> fish { set; get; }

        public TripTO(int id, string name, DateTime start, DateTime end, List<FishTO> fish)
             : this(id, name, start.ToString("yyyy-MM-dd"), end.ToString("yyyy-MM-dd"), fish )
        {}

        public TripTO(int id, string name, string start, string end, List<FishTO> fish)
        {
            this.id = id;
            this.name = name;
            this.startDate = start;
            this.endDate = end;
            this.fish = fish;
        }

        public TripTO()
        {

        }
    }
}