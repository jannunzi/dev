using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wam.Models;

namespace Wam.Controllers
{
    public class ApplicationsController : ApiController
    {
        public List<ApplicationTO> GetAllApplications()
        {
            List<ApplicationTO> applicationTOs = new List<ApplicationTO>();

            using(var db = new WamAppEntities1())
            {
                var applications = from a in db.Applications select a;
                foreach(Application app in applications){
                    ApplicationTO appTO = new ApplicationTO { id = app.Id, name = app.name };
                    applicationTOs.Add(appTO);
                }
            }

            return applicationTOs;
        }

        public List<ApplicationTO> GetApplicationsForUsername(string username)
        {
            List<ApplicationTO> applicationTOs = new List<ApplicationTO>();

            using (var db = new WamAppEntities1())
            {
                var applications = from a in db.Applications
                                   join d in db.Developers
                                   on a.userId equals d.Id
                                   where d.username == username
                                   select a;
                foreach (Application app in applications)
                {
                    ApplicationTO appTO = new ApplicationTO { id = app.Id, name = app.name };
                    applicationTOs.Add(appTO);
                }
            }

            return applicationTOs;
        }


        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}