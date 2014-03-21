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
        public List<User> GetAllUser()
        {
            List<User> users = new List<User>();
            User u1 = new User {username="user1", password="p1"};
            User u2 = new User {username="user2", password="p2"};
            User u3 = new User { username = "user3", password = "p3" };
            users.Add(u1);
            users.Add(u2);
            users.Add(u3);
            return users;
        }
        public User GetUser(int id)
        {
            User u = new User { username = "user4", password = "p4" };
            return u;
        }
        public string PostUser(User newUser)
        {
            return newUser.username;
        }
        public string PutUser(User oldUser)
        {
            return oldUser.username;
        }
        public string DeleteUser(int id)
        {
            return "Delete " + id;
        }
    }
}