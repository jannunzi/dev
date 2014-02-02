<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    public class Application
    {
        public string name = "App";
        public View view;
    }
    public class View
    {
        public string render()
        {
            return "Hello World";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Application app1 = new Application();
        container.Text = app1.view.render();
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
        <asp:Label ID="container" runat="server" Text="Label"></asp:Label>
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
