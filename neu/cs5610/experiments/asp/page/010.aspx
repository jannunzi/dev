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
        public string style = "color:white;background-color:blue;left:50px;top:60px;height:70px;width:80px;position:absolute";
    }
    Page home = new Page();
    protected void Page_Load(object sender, EventArgs e)
    {
        Widget w1 = new Widget();
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

        <h1>Rendering Widget Intances</h1>

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
