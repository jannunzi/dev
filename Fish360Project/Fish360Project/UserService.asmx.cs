using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Fish360Project
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class UserService : System.Web.Services.WebService
    {
        [WebMethod]
        public UserTO FindUserForToken(string token)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                Guid guid = new Guid(token);
                var users = (from u in db.Users
                             where u.token == guid
                             select u).FirstOrDefault();
                if (users != null)
                {
                    UserTO user = new UserTO();
                    user.username = users.username;
                    user.password = users.password;
                    user.id = users.id;
                    user.token = users.token.ToString();
                    return user;
                }
            }
            return null;
        }

        [WebMethod]
        public string ValidateUser(UserTO user)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var users = (from t in db.Users
                             where t.username == user.username
                             && t.password == user.password
                             select t).FirstOrDefault();

                if (users == null)
                    return "unknown user";

                if (users.token != null)
                    user.token = users.token.ToString();
                else
                    user.token = null;

                user.id = users.id;
            }
            return "user validated";
        }

        [WebMethod]
        public string ValidateUsername(UserTO user)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                var users = (from t in db.Users
                             where t.username == user.username
                             select t).FirstOrDefault();
                if (users == null)
                    return "username does not exist";
                user.id = users.id;
                user.token = users.token.ToString();

                if (users == null)
                    return "username does not exist";
            }
            return "username exists";
        }

        [WebMethod]
        public string CreateUser(UserTO user)
        {
            using (var db = new Fish360Project.f360Entities())
            {
                Users newUser = new Users();
                newUser.username = user.username;
                newUser.password = user.password;
                db.Users.Add(newUser);
                db.SaveChanges();
            }
            return "success";
        }

        [WebMethod]
        public string LoginUser(UserTO user)
        {
            string validation = ValidateUser(user);
            Guid guid;
            if (validation == "user validated")
            {
                using (var db = new Fish360Project.f360Entities())
                {
                    var users = (from t in db.Users
                                 where t.username == user.username
                                 && t.password == user.password
                                 select t).FirstOrDefault();

                    guid = Guid.NewGuid();

                    users.token = guid;

                    db.SaveChanges();
                }
                return guid.ToString();
            }
            return "unable to login";
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
    }
}
