using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Fish360Project
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class TripService : System.Web.Services.WebService
    {
        
        [WebMethod]
        public string CreateTrip(TripTO tripTO, string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                UserTO userTO = FindUserForToken(token);

                Trips newTrip = new Trips();
                newTrip.name = tripTO.name;
                newTrip.startDate = DateTime.ParseExact(tripTO.startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                newTrip.endDate = DateTime.ParseExact(tripTO.endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                newTrip.userId = userTO.id;

                db.Trips.Add(newTrip);
                db.SaveChanges();
            }
            return null;
        }

        private DateTime parseDateTimeExactFromString(string date)
        {
            return DateTime.ParseExact(date, "yyyy-MM-dd", CultureInfo.InvariantCulture);
        }

        [WebMethod]
        public string UpdateTrip(TripTO tripTO, string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var guid = new Guid(token);
                var tripDB = (from trip in db.Trips
                             join user in db.Users
                             on trip.userId.Value
                             equals user.id
                             where user.token == guid
                             && trip.id == tripTO.id
                             select trip).FirstOrDefault();
                if (tripDB == null)
                    return null;

                tripDB.name = tripTO.name;
                tripDB.startDate = parseDateTimeExactFromString(tripTO.startDate);
                tripDB.endDate = parseDateTimeExactFromString(tripTO.endDate);
                db.SaveChanges();
            }
            return tripTO.name;
        }

        [WebMethod]
        public string DeleteTripForId(int id, string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var guid = new Guid(token);
                var query = (from trip in db.Trips
                             join user in db.Users
                             on trip.userId.Value
                             equals user.id
                             where user.token == guid
                             && trip.id == id
                             select trip).FirstOrDefault();
                if (query == null)
                    return null;

                db.Trips.Attach(query);
                db.Trips.Remove(query);
                db.SaveChanges();
            }
            return null;
        }

        [WebMethod]
        public TripTO GetTripForId(int id, string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var guid = new Guid(token);
                var query = (from trip in db.Trips
                             join user in db.Users
                             on trip.userId.Value
                             equals user.id
                             where user.token == guid
                             && trip.id == id
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

        [WebMethod]
        public List<TripTO> GetAllTrips(UserTO userTO)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var guid = new Guid(userTO.token);
                var query = (from trip in db.Trips
                             join user in db.Users
                             on   trip.userId.Value
                             equals user.id
                             where user.token == guid
                             select trip);
//                var query = from trip in db.Trips
  //                          where trip.userId == userTO.id
    //                        select trip;

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

        public UserTO FindUserForToken(string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                Guid guid = new Guid(token);
                var users = (from u in db.Users
                             where u.token == guid
                             select u).FirstOrDefault();
                if (users != null)
                {
                    UserTO user = new UserTO();
                    user.username = users.username;
                    user.password = users.password;
                    user.id = users.id;
                    user.token = users.token.ToString();
                    return user;
                }
            }
            return null;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
    }
}
