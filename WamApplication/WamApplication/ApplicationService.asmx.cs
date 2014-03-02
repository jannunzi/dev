using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WamApplication
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ApplicationService : System.Web.Services.WebService
    {
        [WebMethod]
        public List<AppTO> findAll()
        {
            List<AppTO> appsTO = new List<AppTO>();
            using (wamEntities db = new wamEntities())
            {
                var apps = from app in db.Application
                           select app;

                foreach (var app in apps)
                {
                    AppTO appTO = new AppTO();
                    appTO.name = app.name;
                    appTO.id = app.Id;
                    appsTO.Add(appTO);
                }
            }
            return appsTO;
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public int add(int a, int b)
        {
            return a + b;
        }

    }
}
