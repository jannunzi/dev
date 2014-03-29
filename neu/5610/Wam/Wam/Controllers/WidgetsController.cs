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
        public void PutWidgets(WidgetTO widgetTO)
        {
            using (var db = new WamAppEntities1())
            {
                Widget widget = db.Widgets.Find(widgetTO.id);
                int order = widget.order.Value;
                
                if (widgetTO.order == order)
                    return;

                int min = Math.Min(order, widgetTO.order);
                int max   = Math.Max(order, widgetTO.order);
                var widgets = from w in db.Widgets
                                where w.order >= min
                                &&    w.order <= max
                                select w;
                if(widgetTO.order > order)
                {
                    foreach (var wid in widgets)
                    {
                        wid.order--;
                    }
                }
                else
                {
                    foreach (var wid in widgets)
                    {
                        wid.order++;
                    }
                }
                widget.order = widgetTO.order;
                db.SaveChanges();
            }
        }
        public void DeleteWidgets(int id)
        {
            using (var db = new WamAppEntities1())
            {
                Widget widget = db.Widgets.Find(id);
                if(widget != null)
                {
                    db.Widgets.Remove(widget);
                    db.SaveChanges();
                }
            }
        }
        // actually this is not a get, should be a post.
        // creates new widget for pageId
        public void GetWidgetForPage(int pageId, string widgetType, int order)
        {
            widgetType = widgetType.ToUpper();
            using(var db = new WamAppEntities1())
            {
                Widget widget = new Widget();
                widget.name = "Widget Name";
                widget.pageId = pageId;
                widget.widgetType = widgetType;
                widget.height = 0;
                widget.width = 0;
                widget.src = "";
                widget.order = order;
                widget.href = "";
                widget.html = "";
                widget.value = "";
                widget.style = "";
                widget.cssClass = "";

                db.Widgets.Add(widget);
                db.SaveChanges();
            }
        }
        public List<WidgetTO> GetWidgetsForPage(int pageId)
        {
            List<WidgetTO> widgetTOs = new List<WidgetTO>();
            using (var db = new WamAppEntities1())
            {
                var widgets = from w in db.Widgets
                              orderby w.order
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