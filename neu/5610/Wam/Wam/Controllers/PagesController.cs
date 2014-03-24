using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wam.Models;

namespace Wam.Controllers
{
    public class PagesController : ApiController
    {
        public List<PageTO> GetPagesForApplication(int application)
        {
            List<PageTO> pageTOs = new List<PageTO>();
            using (var db = new WamAppEntities1())
            {
                var pages = from p in db.Pages
                            where p.applicationId == application
                            select p;
                foreach (var page in pages)
                {
                    PageTO pageTO = new PageTO { id = page.Id, name = page.name };
                    pageTOs.Add(pageTO);
                }
            }
            return pageTOs;
        }
    }
}