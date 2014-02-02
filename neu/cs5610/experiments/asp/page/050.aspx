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
        ArrayList widgets = (ArrayList)Session["widgets"];
        if (widgets == null)
            widgets = new ArrayList();
        int id = widgets.Count + 1;
        Widget w = new Widget("widget-"+id, "wam-draggable wam-resizable", "yellow", 100, 200, 50, 50);
        widgets.Add(w);
        Session["widgets"] = widgets;

        Repeater1.DataSource = widgets;
        Repeater1.DataBind();
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
        <h1>DataList</h1>

        <h2>Added Session</h2>

        <asp:repeater  id="Repeater1" runat="server">
            <itemtemplate>
                <div id="<%# Eval("id") %>" class="<%# Eval("clazz") %>"
                    style='background-color:<%# Eval("bgColor") %>;position:absolute;left:<%# Eval("left") %>px;top:<%# Eval("top") %>px;width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;'>
                    <%# Eval("id") %>
                </div>
            </itemtemplate>
        </asp:repeater>

        <!-- @new - sticky bottom -->
        <div class="wam-sticky-bottom wam-page-centered">
            <button class="btn btn-primary">Add Widget</button>
            <rasala:FileView ID="fileView" runat="server" />
        </div>
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
