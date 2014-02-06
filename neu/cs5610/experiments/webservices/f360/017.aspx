<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <div class="container">

        <h1>Fish Web Service</h1>

        <div class="row">
            <div class="col-xs-8">

                <h2>Get All Fish for Trip</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva</a>

                <div class="input-group">
                  <input type="text" class="form-control wam-username" value="jsilva" />
                  <span class="input-group-btn">
                    <button class="wam-get-trips btn btn-primary">Get Trips</button>
                  </span>
                </div>


                <h2>Select Trip</h2>


                <div class="input-group">
                    <select class="wam-trips form-control" name="wam-trips">
                    </select>
                    <span class="input-group-btn">
                        <button class="wam-get-fish btn btn-primary">Get Fish</button>
                    </span>
                </div>


                <h2>Fish</h2>
                <ul class="wam-fish list-unstyled">
                </ul>
            </div>
        </div>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <rasala:FileView ID="fileView" runat="server" />
        </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script>
        $(function () {

            // jQuery Cache
            var jqCache = {};
            jqCache.username = $(".wam-username");
            jqCache.trips = $(".wam-trips");
            jqCache.fish = $(".wam-fish");

            // event handlers
            $(".wam-get-trips").click(getTripsEventHandler);
            $(".wam-get-fish").click(getFishEventHandler);

            function getTripsEventHandler() {
                var username = jqCache.username.val();
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php",
                    data: { username: username },
                    dataType: "jsonp",
                    success: function (response) {
                        renderResultSet({
                            container  : jqCache.trips,
                            template   : $('<option class="nid title"></option>'),
                            collection : response,
                            mapping: {nid : "value", title:"html"}
                        })
                    }
                });
            }

            function getFishEventHandler() {
                var tripId = jqCache.trips.val();
                var template = '<li>(<span class="nid"></span>) <span class="title"></span> <span class="field_weight_lbs_value"></span> lbs <span class="field_temperature_value"></span> degrees</li>';
                
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php",
                    data: { fishingTripNodeId: tripId },
                    dataType: "jsonp",
                    success: function (response) {
                        renderResultSet({
                            container: jqCache.fish,
                            template: $(template),
                            collection: response
                        })
                    }
                });
            }
        });
    </script>
</body>
</html>
