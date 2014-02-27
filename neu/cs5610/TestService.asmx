<%@ WebService Language="C#" Class="TestService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Linq;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class TestService  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public string CreateBox() {
/*
        var db = new wamEntities();
        Box box1 = new Box();
        box1.bgColor = "purple";
        box1.left = 10;
        box1.top = 10;
        box1.width = 200;
        box1.height = 200;
        box1.content = "Created by service";
        db.Boxes.Add(box1);
        db.SaveChanges();
        return box1.content;
*/
        return null;
        //    wamEntities
    }    
}