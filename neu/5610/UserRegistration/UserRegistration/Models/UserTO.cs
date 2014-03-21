using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UserRegistration.Models
{
    public class UserTO
    {
        public int id { set; get; }
        public string username { set; get; }
        public string password { set; get; }
    }
}