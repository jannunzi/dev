<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public class Widget
    {
        // need set and get
        public string name {set; get;}
        public string bgColor {set; get;}
        public int left { set; get; }
        public int top { set; get; }
        
        // @new
        public int width{ set; get; }
        public int height { set; get; }
        
        public Widget(string name, string bgColor,
                        int left, int top,
                        int width, int height)
        {
            this.name = name;
            this.bgColor = bgColor;
            this.top = top;
            this.left = left;

            // @new
            this.width = width;
            this.height = height;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // @changed
        Widget w1 = new Widget("Widget 1", "yellow", 100, 200, 50, 50);
        Widget w2 = new Widget("Widget 2", "blue",   200, 200, 50, 50);
        Widget w3 = new Widget("Widget 3", "red",    200, 300, 50, 50);
        Widget w4 = new Widget("Widget 4", "orange", 100, 300, 50, 50);
        
        ArrayList arrValues = new ArrayList(4);
        arrValues.Add(w1);
        arrValues.Add(w2);
        arrValues.Add(w3);
        arrValues.Add(w4);

        Repeater1.DataSource = arrValues;
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

        <h2>Adding Height and Width</h2>

        <asp:repeater  id="Repeater1" runat="server">
            <itemtemplate>
                <div
                    style='background-color:<%# Eval("bgColor") %>;position:absolute;left:<%# Eval("left") %>px;top:<%# Eval("top") %>px;width:<%# Eval("width") %>px;height:<%# Eval("height") %>px;'>
                    <%# Eval("name") %>
                </div>
            </itemtemplate>
        </asp:repeater>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

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
