<%@ WebService Language="C#" Class="UserService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class UserService  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public TripTO getTrip()
    {
        TripTO trip = new TripTO("Trip 123", new DateTime(), new DateTime());
        return trip;
    }

    [WebMethod]
    public TripTO[] getTrips()
    {
        TripTO trip1 = new TripTO("Trip 123", new DateTime(), new DateTime());
        TripTO trip2 = new TripTO("Trip 234", new DateTime(), new DateTime());
        TripTO trip3 = new TripTO("Trip 345", new DateTime(), new DateTime());
        TripTO[] trips = { trip1, trip2, trip3 };
        return trips;
    }

    [WebMethod]
    public UserTO getUserTrips()
    {
        TripTO trip1 = new TripTO("Trip 123", new DateTime(), new DateTime());
        TripTO trip2 = new TripTO("Trip 234", new DateTime(), new DateTime());
        TripTO trip3 = new TripTO("Trip 345", new DateTime(), new DateTime());
        TripTO[] trips = { trip1, trip2, trip3 };

        UserTO user = new UserTO("username123", "password123", trips);
        
        return user;
    }

    [WebMethod]
    public UserTO[] getAllTrips()
    {
        return null;
    }   
}