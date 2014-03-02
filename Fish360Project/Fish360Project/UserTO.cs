using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fish360Project
{
    public class UserTO{
        public UserTO() : this(-1, null, null, null, null) {}
        public UserTO(int id, string username, string password, string password2, string token)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.passwordValidate = password2;
            this.token = token;
        }
        public UserTO(string username, string password) : this(-1, username, password, null, null) {}
        public int id { set; get; }
        public string username { set; get; }
        public string password { set; get; }
        public string passwordValidate { set; get; }
        public string token { set; get; }
    }
}