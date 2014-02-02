<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public class Widget
    {
        // need set and get
        public string name {set; get;}
        public string bgColor {set; get;}

        // @new
        public int top { set; get; }
        public int left { set; get; }
        
        public Widget(string name, string bgColor, int top, int left)
        {
            this.name = name;
            this.bgColor = bgColor;

            // @new
            this.top = top;
            this.left = left;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // @changed
        Widget w1 = new Widget("Widget 1", "yellow", 123, 234);
        Widget w2 = new Widget("Widget 2", "blue",   234, 345);
        Widget w3 = new Widget("Widget 3", "red",    321, 432);
        Widget w4 = new Widget("Widget 4", "orange", 432, 543);
        Widget w5 = new Widget("Widget 5", "green",  23,   34);
        
        ArrayList arrValues = new ArrayList(5);
        arrValues.Add(w1);
        arrValues.Add(w2);
        arrValues.Add(w3);
        arrValues.Add(w4);
        arrValues.Add(w5);

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

        <h2>Raw</h2>
        <asp:repeater  id="Repeater1" runat="server">
            <itemtemplate>
                <div
                    style='background-color:<%# Eval("bgColor") %>;position:absolute;left:<%# Eval("left") %>px;top:<%# Eval("top") %>px;'>
                    <%# Eval("name") %>
                </div>
            </itemtemplate>
        </asp:repeater>
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
