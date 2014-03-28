using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wam.Models
{
    public class FollowingTO
    {
        public int id { set; get; }
        public int followedId { set; get; }
        public string followedUsername { set; get; }
        public int rating { set; get; }
        public DeveloperTO developerTO { set; get; }
    }
}