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
            UserTO u = new UserTO {id=4, username = "user4", password = "p4" };
            return u;
        }
        public string PostUser(UserTO newUser)
        {
            return newUser.username;
        }
        public string PutUser(UserTO oldUser)
        {
            return oldUser.username;
        }
        public string DeleteUser(int id)
        {
            return "Delete " + id;
        }
    }
}