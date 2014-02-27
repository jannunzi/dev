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
    public string CreateNewUserTest(UserTO user)
    {
        if (user.password != user.passwordValidation)
        {
            return "error";
        }
        using (f360.F360Entities db = new f360.F360Entities())
        {
            f360.User newUser = new f360.User();
            newUser.username = user.username;
            newUser.password = user.password;
            db.Users.Add(newUser);
            db.SaveChanges();
        }
        return "success";
    }
    
}