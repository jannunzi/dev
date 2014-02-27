using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LookupUser
/// </summary>
public class UserDAO
{
	public UserDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
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
    public static USER lookup(string username)
    {
        using (var db = new F360Entities())
        {
            var user = (from u in db.USERS
                        where u.username == username
                        select u).FirstOrDefault();
            return user;
        }
    }
    public static USER validate(string username, string password)
    {
        using (var db = new F360Entities())
        {
            var user = (from u in db.USERS
                        where u.username == username
                        && u.password == password
                        select u).FirstOrDefault();
            return user;
        }
    }

    public static bool validateGuid(Guid guid)
    {
        using (var db = new F360Entities())
        {
            var records = ( from g in db.SecurityTokens
                            where g.token == guid
                            select g).FirstOrDefault();
            if (records != null)
                return true;
        }
        return false;
    }

    public static Guid createGuid()
    {
        Guid guid = Guid.NewGuid();

        using (F360Entities db = new F360Entities())
        {
            SecurityToken token = new SecurityToken();
            token.token = guid;
            db.SecurityTokens.Add(token);
            db.SaveChanges();
        }

        return guid;
    }
}