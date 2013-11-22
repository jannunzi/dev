<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="js_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- 01 -->
    <link rel="stylesheet" href="js/jquery-ui-1.10.3/themes/base/jquery-ui.css" />
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
    <script src="js/underscore.js"></script>
    <script src="js/backbone.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <!-- 01 -->
        <h1>Include Dependencies</h1>
        <script>
            $(function () { alert("Hello from jQuery"); });
        </script>

    </div>
    </form>
</body>
</html>
