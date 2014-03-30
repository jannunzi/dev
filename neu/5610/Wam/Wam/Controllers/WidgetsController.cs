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
        public WidgetTO GetWidgets(int widgetId)
        {
            using (var db = new WamAppEntities1())
            {
                Widget widget = db.Widgets.Find(widgetId);
                WidgetTO wto = new WidgetTO
                {
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
                    value = widget.value,
                    order = widget.order.Value,
                    label = widget.label,
                    data = widget.data,
                    content = widget.content
                };
                return wto;
            }
        }
        public void PutWidgets(WidgetTO widgetTO)
        {
            using (var db = new WamAppEntities1())
            {
                Widget widget = db.Widgets.Find(widgetTO.id);
                widget.name = widgetTO.name;
                widget.width = widgetTO.width;
                widget.height = widgetTO.height;
                widget.order = widgetTO.order;
                widget.label = widgetTO.label;
                widget.html = widgetTO.html;
                widget.value = widgetTO.value;
                widget.style = widgetTO.style;
                widget.content = widgetTO.content;
                widget.data = widgetTO.data;

                if (widgetTO.order != widget.order.Value)
                {
                    int min = Math.Min(widget.order.Value, widgetTO.order);
                    int max = Math.Max(widget.order.Value, widgetTO.order);
                    var widgets = from w in db.Widgets
                                  where w.order >= min
                                  && w.order <= max
                                  select w;
                    if (widgetTO.order > widget.order.Value)
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
                }

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