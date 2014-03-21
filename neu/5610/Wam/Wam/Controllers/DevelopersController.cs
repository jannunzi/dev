using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wam.Models;

namespace Wam.Controllers
{
    public class DevelopersController : ApiController
    {
        // GET api/<controller>
        public List<DeveloperTO> GetAllDevelopers()
        {
            List<DeveloperTO> developers = new List<DeveloperTO>();

            using (var db = new WamAppEntities1())
            {
                var devs = from d in db.Developers select d;

                foreach(Developer d in devs) {
                    DeveloperTO dev = new DeveloperTO { id = d.Id, password = d.password, username = d.username };
                    developers.Add(dev);
                }

            }

/*
            DeveloperTO d1 = new DeveloperTO { id=123, username = "user1", password = "p1" };
            DeveloperTO d2 = new DeveloperTO { id=234, username = "user2", password = "p2" };
            DeveloperTO d3 = new DeveloperTO { id=345, username = "user3", password = "p3" };

            developers.Add(d1);
            developers.Add(d2);
            developers.Add(d3);
 * */

            return developers;
        }

        // GET api/<controller>/5
        public DeveloperTO GetDeveloper(int id)
        {
            DeveloperTO d4 = null;// new DeveloperTO { id = id, username = "user " + id, password = "p3" };

            using (var db = new WamAppEntities1())
            {
                Developer dev = db.Developers.Find(id);
                d4 = new DeveloperTO { id = dev.Id, username = dev.username, password = dev.password };
            }

            return d4;
        }

        public DeveloperTO GetDeveloperByUsername(string username)
        {
            DeveloperTO d5 = null;

            using (var db = new WamAppEntities1())
            {
                var devs = from d in db.Developers where d.username==username select d;
                Developer dd = devs.FirstOrDefault();
                if(dd != null)
                    d5 = new DeveloperTO { id = dd.Id, password = dd.password, username = dd.username };
            }

            return d5;
        }

        // POST api/<controller>
        public string PostDeveloper(DeveloperTO developer)
        {
            using(var db = new WamAppEntities1())
            {
                Developer newDeveloper = new Developer();
                newDeveloper.username = developer.username;
                newDeveloper.password = developer.password;
                db.Developers.Add(newDeveloper);
                db.SaveChanges();
            }
            return developer.username;
        }

        // PUT api/<controller>/5
        public string PutDeveloper(int id, DeveloperTO developer)
        {
            using (var db = new WamAppEntities1())
            {
                Developer dev = db.Developers.Find(id);
                dev.password = developer.password;
                db.SaveChanges();
            }
            return developer.username + " " + id;
        }

        // DELETE api/<controller>/5
        public int DeleteDeveloper(int id)
        {
            using (var db = new WamAppEntities1())
            {
                Developer dev = db.Developers.Find(id);
                db.Developers.Remove(dev);
                db.SaveChanges();
            }
            return id;
        }
    }
}