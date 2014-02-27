using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TripDAO
{
	public TripDAO() {}
    public static void create(string username, string password)
    {
        using (var db = new F360Entities())
        {
            USER user = new USER();
            user.username = username;
            user.password = password;
            db.USERS.Add(user);
            db.SaveChanges();
        }
    }
    public static Trip[] selectAll()
    {
        using (var db = new F360Entities())
        {
//            ArrayList tripArray = new ArrayList();

            var trips = (from t in db.Trips
                        select t);
            foreach(var trip in trips) {
                
            }
        }
        return null;
    }
}