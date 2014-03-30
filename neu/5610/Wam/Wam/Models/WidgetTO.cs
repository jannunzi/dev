using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wam.Models
{
    public class WidgetTO
    {
        public int id { set; get; }
        public string name { set; get; }
        public int pageId { set; get; }
        public string widgetType { set; get; }
        public string url { set; get; }
        public string href { set; get; }
        public string src { set; get; }
        public string html { set; get; }
        public string style { set; get; }
        public string cssClass { set; get; }
        public int width { set; get; }
        public int height { set; get; }
        public string value { set; get; }
        public int order { set; get; }
        public string label { set; get; }
        public string data { set; get; }
        public string content { set; get; }
    }
}