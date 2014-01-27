<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Goto Renderer Generalization</h1>

        <div class="row">
            <div class="col-sm-3">

                <div class="wam-script">

                </div>

            </div>
        </div>

        <br />

        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>
    <script>
        $(function () {
            renderBox(10, "Content 10");
            renderDownArrow();
            renderBox(20, "Content 20");
            renderDownArrow();
            renderBox(30, "Content 30");
            renderDownArrow();
            renderBox(40, "Content 40");

            gotoRenderer(30, 20);
            gotoRenderer(40, 10);
        });
    </script>
</body>
</html>
