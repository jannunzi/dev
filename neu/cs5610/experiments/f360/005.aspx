<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    
    <!-- @new -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.flatly.css" />
    <link rel="stylesheet" type="text/css" href="~/css/f360.css" />
</head>
<body>

    <!-- @new -->
    <div class="navbar navbar-default navbar-fixed-top">
    </div>

    <!-- @new -->
    <div class="container">
        <h1>Header & Footer</h1>
    </div>

    <!-- @new -->
    <div class="navbar navbar-default navbar-fixed-bottom">
    </div>

    <form id="form1" runat="server">
        <rasala:FileView ID="fileView" runat="server" />
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
