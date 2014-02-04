<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    // @new
    public class Widget
    {
        // need set and get
        public string name {set; get;}
        public string bgColor {set; get;}
        
        public Widget(string name, string bgColor)
        {
            this.name = name;
            this.bgColor = bgColor;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        // @new
        Widget w1 = new Widget("Widget 1", "yellow");
        Widget w2 = new Widget("Widget 2", "blue");
        Widget w3 = new Widget("Widget 3", "red");
        Widget w4 = new Widget("Widget 4", "orange");
        Widget w5 = new Widget("Widget 5", "green");
        
        ArrayList arrValues = new ArrayList(5);
        // @changed
        arrValues.Add(w1);
        arrValues.Add(w2);
        arrValues.Add(w3);
        arrValues.Add(w4);
        arrValues.Add(w5);

        Repeater1.DataSource = arrValues;
        Repeater1.DataBind();

        Repeater2.DataSource = arrValues;
        Repeater2.DataBind();

        Repeater3.DataSource = arrValues;
        Repeater3.DataBind();
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
                <span style='background-color:<%# Eval("bgColor") %>'>
                <%# Eval("name") %>
                </span>
            </itemtemplate>
        </asp:repeater>

        <h2>List</h2>
        <ul>
        <asp:repeater  id="Repeater2" runat="server">
            <itemtemplate>
                <li style='background-color:<%# Eval("bgColor") %>'>
                    <%# Container.DataItem %>
                </li>
            </itemtemplate>
        </asp:repeater>
        </ul>

        <h2>Table</h2>
        <table class="table">
        <asp:repeater  id="Repeater3" runat="server">
            <itemtemplate>
                <tr style='background-color:<%# Eval("bgColor") %>'>
                    <td><%# Container.DataItem %></td>
                </tr>
            </itemtemplate>
        </asp:repeater>
        </table>

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
