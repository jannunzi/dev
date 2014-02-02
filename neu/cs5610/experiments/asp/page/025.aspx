<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList arrValues = new ArrayList(4);
        arrValues.Add("Widget A");
        arrValues.Add("Widget B");
        arrValues.Add("Widget C");
        arrValues.Add("Widget D");
        arrValues.Add("Widget E");

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
                <%# Container.DataItem %>
            </itemtemplate>
        </asp:repeater>

        <h2>List</h2>
        <ul>
        <asp:repeater  id="Repeater2" runat="server">
            <itemtemplate>
                <li><%# Container.DataItem %></li>
            </itemtemplate>
        </asp:repeater>
        </ul>

        <h2>Table</h2>
        <table class="table">
        <asp:repeater  id="Repeater3" runat="server">
            <itemtemplate>
                <tr><td><%# Container.DataItem %></td></tr>
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
