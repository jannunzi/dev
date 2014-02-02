<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public class Widget
    {
        // need set and get
        public string id { set; get; }
        public string clazz { set; get; }
        public string bgColor { set; get; }
        public int left { set; get; }
        public int top { set; get; }
        public int width{ set; get; }
        public int height { set; get; }
        public Widget(string id, string clazz, string bgColor,
                        int left, int top,
                        int width, int height)
        {
            this.id = id;
            this.clazz = clazz;
            this.bgColor = bgColor;
            this.top = top;
            this.left = left;
            this.width = width;
            this.height = height;
        }
    }
    
    // @changed
    protected void Page_Load(object sender, EventArgs e)
    {
        int left = 150, top = 150, width = 150, height = 150, id;
        string leftStr, topStr, widthStr, heightStr, idStr;
        
        string clear = Request.Params["wam-clear"];
        if (clear != null)
            Session["widgets"] = null;

        ArrayList widgets = (ArrayList)Session["widgets"];
        if (widgets == null)
            widgets = new ArrayList();

        string delete = Request.Params["wam-delete"];
        if (delete != null)
        {
            for (int i = 0; i < widgets.Count; i++)
            {
                Widget w = (Widget)widgets[i];
                if (delete == w.id)
                    widgets.RemoveAt(i);
            }
        }

        idStr = Request.Params["wam-id"];
        if (idStr != null)
            int.TryParse(idStr, out id);
        
        // @new
        topStr = Request.Params["wam-top"];
        leftStr = Request.Params["wam-left"];
        if (topStr != null && leftStr != null)
        {
            int.TryParse(topStr, out top);
            int.TryParse(leftStr, out left);
            for (int i = 0; i < widgets.Count; i++)
            {
                Widget w = (Widget)widgets[i];
                if (idStr == w.id)
                {
                    w.top = top;
                    w.left = left;
                }                
            }
        }
                
        string add = Request.Params["wam-add"];
        if (add != null)
        {
            string bgColor = Request.Params["wam-bg-color"];
            if (bgColor == null)
                bgColor = "#aaaaaa";

            leftStr = Request.Params["wam-left"];
            if (leftStr != null)
                int.TryParse(leftStr, out left);
            
            topStr = Request.Params["wam-top"];
            if (topStr != null)
                int.TryParse(topStr, out top);
            
            widthStr = Request.Params["wam-width"];
            if (widthStr != null)
                int.TryParse(widthStr, out width);
            
            heightStr = Request.Params["wam-height"];
            if (heightStr != null)
                int.TryParse(heightStr, out height);

            id = widgets.Count + 1;
            Widget w = new Widget("widget-" + id, "wam-draggable wam-resizable", bgColor, left, top, width, height);
            widgets.Add(w);
            Session["widgets"] = widgets;
        }

        Repeater1.DataSource = widgets;
        Repeater1.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/jquery/jquery.ui.all.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>DataList</h1>

        <h2>Save Position</h2>

        <asp:repeater  id="Repeater1" runat="server">
            <itemtemplate>
                <div id="<%# Eval("id") %>" class="<%# Eval("clazz") %> wam-widget"
                    style='background-color:<%# Eval("bgColor") %>;position:absolute;left:<%# Eval("left") %>px;top:<%# Eval("top") %>px;width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;'>
                    <a class="wam-delete wam-black pull-right" href="?wam-delete=<%# Eval("id") %>">&times;</a>
                    <%# Eval("id") %>
                </div>
            </itemtemplate>
        </asp:repeater>

        <div class="wam-page-centered">
            <div class="wam-sticky-bottom">
                <input type="color"  name="wam-bg-color"/>
                <input type="number" name="wam-left"    placeholder="Left"   value="150"/>
                <input type="number" name="wam-top"     placeholder="Top"    value="150"/>
                <input type="number" name="wam-width"   placeholder="Width"  value="150"/>
                <input type="number" name="wam-height"  placeholder="Height" value="150"/>
                <button class="btn btn-primary" name="wam-add">Add Widget</button>
                <button class="btn btn-primary" name="wam-clear">Clear Session</button>
                <rasala:FileView ID="fileView" runat="server" />
            </div>
        </div>
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script>
        $(function () {

            // @new
            $(".wam-widget").on( "dragstop", handleDragStop );
        });

        // @new
        function handleDragStop(event, ui) {
            var id = "wam-id="+ui.helper.attr("id");
            var top = "wam-top="+ui.position.top;
            var left = "wam-left="+ui.position.left;
            window.location.href = "?"+top+"&"+left+"&"+id;
        }
    </script>
</body>
</html>
