using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UserTO
{
	public UserTO() { }
    public UserTO(string username, string password, TripTO[] trips)
    {
        this.username = username;
        this.password = password;
        this.trips = trips;
    }
    public string username;
    public string password;
    public TripTO[] trips;
}