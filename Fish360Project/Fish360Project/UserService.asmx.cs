using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Fish360Project
{
    /// <summary>
    /// Summary description for UserService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class UserService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
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
        public string LogoutUser()
        {
            return "Hello World";
        }

        [WebMethod]
        public string ChangePassword()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetAllUsers()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetUserById(int id)
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetUserByUsername(string username)
        {
            return "Hello World";
        }
    }
}
