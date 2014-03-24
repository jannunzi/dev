using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Wam.Models;

namespace Wam.Controllers
{
    public class WidgetsController : ApiController
    {
        public List<WidgetTO> GetWidgetsForPage(int pageId)
        {
            List<WidgetTO> widgetTOs = new List<WidgetTO>();
            using (var db = new WamAppEntities1())
            {
                var widgets = from w in db.Widgets
                              where w.pageId == pageId
                              select w;
                foreach (var widget in widgets)
                {
                    WidgetTO widgetTO = new WidgetTO {
                        id = widget.Id,
                        name = widget.name,
                        pageId = widget.pageId.Value,
                        widgetType = widget.widgetType,
                        url = widget.url,
                        href = widget.href,
                        src = widget.src,
                        html = widget.html,
                        style = widget.style,
                        cssClass = widget.cssClass,
                        width = widget.width.Value,
                        height = widget.height.Value,
                        value = widget.value
                    };
                    widgetTOs.Add(widgetTO);
                }
            }
            return widgetTOs;
        }
    }
}