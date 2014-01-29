<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Template</h1>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script>
        $(function () {
            var state = 0;
            while (true) {
                switch (state) {
                    case 0 :
                        var i = 1;
                        alert(i);
                        if (i > 10) state = 1;
                    case 1:

                }
            }
        });
    </script>
</body>
</html>
