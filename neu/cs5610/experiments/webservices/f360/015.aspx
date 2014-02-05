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

                <h2>Get All Fish for Username and Node Id</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishForUserAndFishingTrip.php?fishingTripNodeId=79&username=jsilva"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishForUserAndFishingTrip.php?fishingTripNodeId=79&username=jsilva</a>

                <pre>
</pre>
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
