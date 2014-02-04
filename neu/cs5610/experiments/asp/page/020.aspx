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

        widgetsDataList.DataSource = arrValues;
        widgetsDataList.DataBind();
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

        <h1>Iterate Over ArrayList of Widgets with DataList Control</h1>

        <asp:datalist  id="widgetsDataList" runat="server">
            <itemtemplate>
                <%# Container.DataItem %>
            </itemtemplate>
        </asp:datalist>

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
