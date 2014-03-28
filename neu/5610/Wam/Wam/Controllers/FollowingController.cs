using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wam.Models;

namespace Wam.Controllers
{
    public class FollowingController : ApiController
    {
        public List<FollowingTO> GetAllFollowing()
        {
            List<FollowingTO> followingTOs = new List<FollowingTO>();

            FollowingTO to1 = new FollowingTO { id = 123, followedId = 11, followedUsername = "followed11", rating = 5 };
            FollowingTO to2 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
            FollowingTO to3 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };

            followingTOs.Add(to1);
            followingTOs.Add(to2);
            followingTOs.Add(to3);

            return followingTOs;
        }
        public List<FollowingTO> GetFollowingForId(int id)
        {
            List<FollowingTO> followingTOs = new List<FollowingTO>();

//            FollowingTO to2 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
  //          FollowingTO to3 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };

            using(var db = new WamAppEntities1())
            {
                var fs = from f in db.Followings
                         where f.followerId == id
                         select f;

                foreach (var ff in fs)
                {
                    FollowingTO to = new FollowingTO
                    {
                        followedId = ff.followedId.Value,
                        followedUsername = ff.followedUsername
                    };
                    followingTOs.Add(to);
                }
            }

//            followingTOs.Add(to2);
  //          followingTOs.Add(to3);

            return followingTOs;
        }
        public List<FollowingTO> GetFollowingForSearch(string search)
        {
            List<FollowingTO> followingTOs = new List<FollowingTO>();

            FollowingTO to2 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
            FollowingTO to3 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };
            FollowingTO to4 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
            FollowingTO to5 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };
            FollowingTO to6 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
            FollowingTO to7 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };
            FollowingTO to8 = new FollowingTO { id = 234, followedId = 22, followedUsername = "followed22", rating = 6 };
            FollowingTO to9 = new FollowingTO { id = 345, followedId = 33, followedUsername = "followed33", rating = 7 };

            followingTOs.Add(to2);
            followingTOs.Add(to3);
            followingTOs.Add(to4);
            followingTOs.Add(to5);
            followingTOs.Add(to6);
            followingTOs.Add(to7);
            followingTOs.Add(to8);
            followingTOs.Add(to9);

            return followingTOs;
        }
    }
}