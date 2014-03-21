using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wam.Models
{
    public class DeveloperTO
    {
        public int id { set; get; }
        public string username { set; get; }
        public string password { set; get; }
        public DeveloperTO() { }
    }
}