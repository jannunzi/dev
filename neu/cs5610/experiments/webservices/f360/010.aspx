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
                <h2>Get a Trip for Node Id</h2>
                <a  href="http://dev.fish360.net/autotideapp/services/GetFishingTripForNodeId.php?fishingTripNodeId=79"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetFishingTripForNodeId.php?fishingTripNodeId=79</a>

                <pre>
{
  "trip": {
    "nid": "79",
    "vid": "79",
    "type": "fishing_trip_type",
    "language": "en",
    "title": "Cuttyhunk Trip",
    "uid": "1",
    "status": "1",
    "created": "1247176137",
    "changed": "1249068582",
    "comment": "0",
    "promote": "0",
    "moderate": "0",
    "sticky": "0",
    "tnid": "0",
    "translate": "0",
    "field_stop_value": "2009-07-02 21:47:00",
    "field_start_value": "2009-07-02 01:47:00"
  }
}</pre>
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
