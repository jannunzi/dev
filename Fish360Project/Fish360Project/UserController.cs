using System;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Fish360Project
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController
    {
        [Route("api/user/{username}/{password}")]
        [HttpGet]
        public UserTO Login(string username, string password)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var usr = (from user in db.Users
                           where user.username == username
                           && user.password == password
                           select user).FirstOrDefault();

                if (usr == null)
                    return null;

                UserTO newUserTO = new UserTO();
                newUserTO.id = usr.id;
                newUserTO.username = usr.username;
                newUserTO.password = usr.password;
                newUserTO.token = usr.token.ToString();

                return newUserTO;
            }
        }

        [Route("api/user/")]
        [HttpPost]
        public void Register([FromBody]UserTO userTO)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                Users newUser = new Users();
                newUser.username = userTO.username;
                newUser.password = userTO.password;
                newUser.token = Guid.NewGuid();

                db.Users.Add(newUser);
                db.SaveChanges();
            }
        }
    }
}