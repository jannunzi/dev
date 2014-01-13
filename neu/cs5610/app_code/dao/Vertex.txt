using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace wam {

    public class Vertex
    {
	    public Vertex() {}
        public override string ToString()
        {
            return this.id + " " + this.name + " " + this.label + " " + this.x + " " + this.y;
        }
        public Vertex(int id, string name, string label, int x, int y, int width, int height)
        {
            this.id = id;
            this.name = name;
            this.label = label;
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }
        public int id { set; get; }
        public string name { set; get; }
        public string label { set; get; }
        public int x { set; get; }
        public int y { set; get; }
        public int width { set; get; }
        public int height { set; get; }
    }
}
