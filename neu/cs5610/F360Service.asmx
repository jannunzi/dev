<%@ WebService Language="C#" Class="F360Service" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class F360Service  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public string CreateNewUserTest()
    {
        using (f360.F360Entities db = new f360.F360Entities())
        {
            f360.User newUser = new f360.User();
            newUser.username = "test1";
            newUser.password = "password123";
            db.Users.Add(newUser);
            db.SaveChanges();
        }
        return "Hello World";
    }
    
}