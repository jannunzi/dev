using System;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Fish360Project
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TripController : ApiController
    {
        [Route("api/trip/")]
        [HttpGet]
        public List<TripTO> GetAllTrips()
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var query = (from trip in db.Trips select trip);

                List<TripTO> trips = new List<TripTO>();

                foreach (var t in query)
                {
                    TripTO trip = new TripTO();
                    trip.id = t.id;
                    trip.name = t.name;
                    if (t.startDate != null)
                        trip.startDate = ((DateTime)t.startDate).ToString("yyyy-MM-dd");
                    if (t.endDate != null)
                        trip.endDate = ((DateTime)t.endDate).ToString("yyyy-MM-dd");
                    trips.Add(trip);
                }

                return trips;
            }
        }

//        [Route("api/user/{id}/trip/")]
        [Route("api/tripsForUser/{id}")]
        [HttpGet]
        public List<TripTO> GetAllTripsForUserId(int id)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var query = (from trip in db.Trips
                             join user in db.Users on trip.userId equals user.id
                             where user.id == id
                             select trip);

                List<TripTO> trips = new List<TripTO>();

                foreach (var t in query)
                {
                    TripTO trip = new TripTO();
                    trip.id = t.id;
                    trip.name = t.name;
                    if (t.startDate != null)
                        trip.startDate = ((DateTime)t.startDate).ToString("yyyy-MM-dd");
                    if (t.endDate != null)
                        trip.endDate = ((DateTime)t.endDate).ToString("yyyy-MM-dd");
                    trips.Add(trip);
                }

                return trips;
            }
        }

        [Route("api/tripsForUsername/{username}")]
        [HttpGet]
        public List<TripTO> GetAllTripsForUsername(string username)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var query = (from trip in db.Trips
                             join user in db.Users on trip.userId equals user.id
                             where user.username == username
                             select trip);

                List<TripTO> trips = new List<TripTO>();

                foreach (var t in query)
                {
                    TripTO trip = new TripTO();
                    trip.id = t.id;
                    trip.name = t.name;
                    if (t.startDate != null)
                        trip.startDate = ((DateTime)t.startDate).ToString("yyyy-MM-dd");
                    if (t.endDate != null)
                        trip.endDate = ((DateTime)t.endDate).ToString("yyyy-MM-dd");
                    trips.Add(trip);
                }

                return trips;
            }
        }

        // GET api/<controller>/5
        [Route("api/trip/{id}")]
        [HttpGet]
        public TripTO GetTripForId(int id)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var query = (from trip in db.Trips
                             where trip.id == id
                             select trip).FirstOrDefault();

                if (query == null)
                    return null;

                TripTO tripTO = new TripTO();

                tripTO.id = query.id;
                tripTO.name = query.name;
                tripTO.startDate = ((DateTime)query.startDate).ToString("yyyy-MM-dd");
                tripTO.endDate = ((DateTime)query.endDate).ToString("yyyy-MM-dd");

                return tripTO;
            }
        }

        // POST api/<controller>
        [Route("api/trip/")]
        [HttpPost]
        public void Post([FromBody]TripTO tripTO)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                Trips newTrip = new Trips();
                newTrip.name = tripTO.name;
                newTrip.startDate = DateTime.ParseExact(tripTO.startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                newTrip.endDate = DateTime.ParseExact(tripTO.endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                newTrip.userId = tripTO.userId;

                db.Trips.Add(newTrip);
                db.SaveChanges();
            }
        }

        // PUT api/<controller>/5
        [Route("api/trip/")]
        [HttpPut]
        public void Put([FromBody]TripTO tripTO)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var tripDB = (from trip in db.Trips
                              where trip.id == tripTO.id
                              select trip).FirstOrDefault();

                tripDB.name = tripTO.name;
                tripDB.startDate = parseDateTimeExactFromString(tripTO.startDate);
                tripDB.endDate = parseDateTimeExactFromString(tripTO.endDate);
                db.SaveChanges();
            }
        }

        // DELETE api/<controller>/5
        [Route("api/trip/{id}")]
        [HttpDelete]
        public void Delete(int id)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var query = (from trip in db.Trips
                             where trip.id == id
                             select trip).FirstOrDefault();

                if (query != null)
                {
                    db.Trips.Attach(query);
                    db.Trips.Remove(query);
                    db.SaveChanges();
                }
            }
        }

        private DateTime parseDateTimeExactFromString(string date)
        {
            return DateTime.ParseExact(date, "yyyy-MM-dd", CultureInfo.InvariantCulture);
        }
    }
}