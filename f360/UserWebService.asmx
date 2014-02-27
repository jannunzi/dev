<%@ WebService Language="C#" Class="UserWebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Services.Protocols;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
[System.Web.Script.Services.ScriptService]
public class UserWebService  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public Response ValidateLogin(Login login)
    {
        /*
        using ( var db = new F360Entities() ) {
            var usersQuery = from users in db.Users
                             where users.username = login.username and users.password = login.password
                             select users;
            
        }
*/                
        Response resp = new Response();
        resp.response = "this is the username " + login.username;
        return resp;
    }

}