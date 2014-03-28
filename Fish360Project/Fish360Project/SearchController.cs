using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Fish360Project
{
    public class SearchController : ApiController
    {
        [Route("api/search/")]
        [HttpPost]
        public List<FishTO> PostSearch(FishTO search)
        {
            List<FishTO> ftos = new List<FishTO>();

            if(search.name != null && search.name != "")
            {
                using (var db = new Fish360Project.f360Entities())
                {
                    var fishes = (from fish in db.Fish where fish.name == search.name select fish);

                    foreach (Fish fsh in fishes)
                    {
                        FishTO fishTO = new FishTO();
                        fishTO.id = fsh.id;
                        fishTO.name = fsh.name;
                        fishTO.species = fsh.species;
                        fishTO.tripId = (int)fsh.tripId;
                        fishTO.weight = (double)fsh.weight;
                        fishTO.length = (double)fsh.length;
                        if (fsh.caughtDate != null)
                            fishTO.caughtDate = ((DateTime)fsh.caughtDate).ToString("yyyy-MM-dd HH:mm:ss tt");

                        fishTO.girth = fsh.girth;
                        fishTO.spot = fsh.spot;
                        fishTO.presentation = fsh.presentation;
                        fishTO.depth = fsh.depth;
                        fishTO.clarity = fsh.clarity;
                        fishTO.temperature = fsh.temperature;

                        ftos.Add(fishTO);
                    }
                }
            }

            return ftos;
        }
    }
}