<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.flatly.css" />
    <link rel="stylesheet" type="text/css" href="~/css/f360.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Template</h1>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
