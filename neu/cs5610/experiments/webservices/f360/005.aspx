<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Fish Web Service</h1>

        <div class="row">
            <div class="col-xs-8">

                <h2>Get All Trips for Username</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva</a>

<pre>
[
    {
        0: "jsilva",
        1: "Fishing Trip 123",
        2: "25",
        name: "jsilva",
        title: "Fishing Trip 123",
        nid: "25"
    },
    {
        0: "jsilva",
        1: "New Fishing Trip",
        2: "456",
        name: "jsilva",
        title: "New Fishing Trip",
        nid: "456"
    },
    {
        0: "jsilva",
        1: "Test New FCK Editor",
        2: "59",
        name: "jsilva",
        title: "Test New FCK Editor",
        nid: "59"
    },
    {
        0: "jsilva",
        1: "Cuttyhunk Trip",
        2: "79",
        name: "jsilva",
        title: "Cuttyhunk Trip",
        nid: "79"
    }
    ...
]</pre>
            </div>
        </div>

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
