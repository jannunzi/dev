using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fish360Project
{
    public class UserTO{
        public UserTO() : this(null, null, null) {}
        public UserTO(string username, string password, string password2)
        {
            this.username = username;
            this.password = password;
            this.passwordValidate = password2;
        }
        public UserTO(string username, string password) : this(username, password, null) {}
        public string username { set; get; }
        public string password { set; get; }
        public string passwordValidate { set; get; }
    }
}