<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public class Page
    {
        public string name { set; get; }
        public string html { set; get; }
        public ArrayList widgets;
    }
    public class Widget
    {
        public string name = "widget-0";
        
        // @changed
        public Style style;
        
    }
    
    // @new
    public class Style
    {
        public ArrayList attributes;
        public override string ToString()
        {
            string str = "";
            foreach (Tuple<string, string> attribute in attributes)
            {
                str += attribute.Item1 + ":" + attribute.Item2 + ";";
            }
            return str;
        }
    }
    
    Page home = new Page();
    protected void Page_Load(object sender, EventArgs e)
    {
        // @news
        var color    = new Tuple<string, string>("color", "white");
        var bgColor  = new Tuple<string, string>("background-color", "blue");
        var top      = new Tuple<string, string>("top", "100px");
        var left     = new Tuple<string, string>("left", "200px");
        var width    = new Tuple<string, string>("width", "100px");
        var height   = new Tuple<string, string>("height", "150px");
        var position = new Tuple<string, string>("position", "absolute");
        Style s1 = new Style();
        s1.attributes = new ArrayList();
        s1.attributes.Add(color);
        s1.attributes.Add(bgColor);
        s1.attributes.Add(top);
        s1.attributes.Add(left);
        s1.attributes.Add(width);
        s1.attributes.Add(height);
        s1.attributes.Add(position);
        
        Widget w1 = new Widget();
        
        // @changed
        w1.style = s1;
        
        ArrayList widgets = new ArrayList();
        widgets.Add(w1);

        home.name = "Home";
        home.widgets = widgets;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <%  foreach (Widget w in home.widgets)
            {%>
                <div style="<%= w.style %>">
                    <%= w.name %>
                </div>
        <%  }
             %>
        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
