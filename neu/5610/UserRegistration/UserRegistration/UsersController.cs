using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using UserRegistration.Models;

namespace UserRegistration
{
    public class UsersController : ApiController
    {
        public List<UserTO> GetAllUser()
        {
            List<UserTO> users = new List<UserTO>();
            using (var db = new UserRegistrationEntities1())
            {
                var query = from dev in db.Developers
                            select dev;
                foreach (var d in query)
                {
                    UserTO u = new UserTO();
                    u.username = d.username;
                    u.password = d.password;
                    users.Add(u);
                }
            }
            return users;
        }
        public UserTO GetUser(int id)
        {
            UserTO u = new UserTO();
            using (var db = new UserRegistrationEntities1())
            {
                Developer dev = db.Developers.Find(id);
                u = new UserTO { id = dev.Id, username = dev.username, password = dev.password };
            }
            return u;
        }
        public string PostUser(UserTO newUser)
        {
            using (var db = new UserRegistrationEntities1())
            {
                Developer dev = new Developer();
                dev.username = newUser.username;
                dev.password = newUser.password;
                db.Developers.Add(dev);
                db.SaveChanges();
            }
            return newUser.username;
        }
        public string PutUser(int id, UserTO oldUser)
        {
            using (var db = new UserRegistrationEntities1())
            {
                Developer dev = db.Developers.Find(id);
                dev.password = oldUser.password;
                dev.username = oldUser.username;
                db.SaveChanges();
            }
            return oldUser.username;
        }
        public string DeleteUser(int id)
        {
            using (var db = new UserRegistrationEntities1())
            {
                Developer dev = db.Developers.Find(id);
                db.Developers.Remove(dev);
                db.SaveChanges();
            }
            return "Delete " + id;
        }
        public List<UserTO> GetUserByUsername(string username)
        {
            List<UserTO> users = new List<UserTO>();
            using (var db = new UserRegistrationEntities1())
            {
                var query = from dev in db.Developers
                            where dev.username == username
                            select dev;

                foreach (var d in query)
                {
                    UserTO u = new UserTO();
                    u.username = d.username;
                    u.password = d.password;
                    users.Add(u);
                }
            }
            return users;
        }
    }
}