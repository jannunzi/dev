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

                <h2>Drill Down From Trips to Fish</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php?username=jsilva</a>

                <div class="input-group">
                  <input type="text" class="form-control wam-username" value="jsilva" />
                  <span class="input-group-btn">
                    <button class="wam-get-trips btn btn-primary">Get Trips</button>
                  </span>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-xs-6">
                <h2>Render Trip List with Template</h2>

                <ul style="height:200px;" class="wam-trips wam-overflow-y-scroll list-unstyled"></ul>

            </div>

            <div class="col-xs-6">

                <h2>Trip Details</h2>

                <div class="wam-trip-details form-horizontal" role="form">
            
                    <input type="hidden" class="nid wam-trip-id" />
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control title" placeholder="Trip Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Start Date</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control field_start_value"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">End Date</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control field_stop_value"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <button class="wam-get-fish btn btn-primary">Fish</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-6">

                <h2>Fish List</h2>

                <ul style="height:200px;" class="wam-fish list-unstyled wam-overflow-y-scroll"></ul>

            </div>

            <div class="col-xs-6">
                <h2>Fish Details</h2>
                <input type="hidden" class="nid wam-fish-id" />
                    
                <div class="form-group">
                    <label class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control title" placeholder="Fish Name"/>
                    </div>
                </div>
            </div>

        </div>

    </div>


    <div class="wam-templates">
        <ul class="wam-trips-template">
            <li><a class="nid" href="#"><span class="title"></span></a></li>
        </ul>

        <!-- @new -->
        <ul class="wam-fish-template">
            <li><a class="nid" href="#"><span class="title"></span></a></li>
        </ul>
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
            jqCache.tripTemplate = $(".wam-trips-template li");
            jqCache.tripDetails = $(".wam-trip-details");

            jqCache.tripId = $(".wam-trip-id");
            jqCache.fish = $(".wam-fish");
            jqCache.fishTemplate = $(".wam-fish-template li");

            // event handlers
            $(".wam-get-trips").click(getTripsEventHandler);
            $(".wam-trips").on("click", "a", selectTripHandler);

            // @new
            $(".wam-fish").on("click", "a", selectFishHandler);

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
                            template   : jqCache.tripTemplate,
                            collection: response,
                            mapping : { nid : "id" }
                        })
                    }
                });
            }

            function selectTripHandler() {
                var a = $(this);
                var id = a.attr("id");
                console.log(id);
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetFishingTripForNodeId.php",
                    data: { fishingTripNodeId: id },
                    dataType: "jsonp",
                    success: function (response) {
                        response.field_start_value = stripOutTime(response.field_start_value);
                        response.field_stop_value = stripOutTime(response.field_stop_value);
                        renderObject({
                            object: response,
                            dom: jqCache.tripDetails
                        })
                    }
                })
            }

            // @new
            function selectFishHandler() {
                var a = $(this);
                var id = a.attr("id");
                alert(id);
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetFishingTripForNodeId.php",
                    data: { fishingTripNodeId: id },
                    dataType: "jsonp",
                    success: function (response) {
                        response.field_start_value = stripOutTime(response.field_start_value);
                        response.field_stop_value = stripOutTime(response.field_stop_value);
                        renderObject({
                            object: response,
                            dom: jqCache.tripDetails
                        })
                    }
                })
            }

            function getFishEventHandler() {
                id = jqCache.tripId.val();
                $.ajax({
                    url: "http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php",
                    data: { fishingTripNodeId: id },
                    dataType : "jsonp",
                    success: function (response) {
                        renderCollection({
                            collection: response,
                            template: jqCache.fishTemplate,
                            container: jqCache.fish,
                            mapping : {nid: "id"}
                        });
                    }
                })
            }
        });
    </script>
</body>
</html>


<!--
jQuery20306281167541164905_1391647526295({"0":"25","nid":"25","1":"25","vid":"25","2":"fishing_trip_type","type":"fishing_trip_type","3":"en","language":"en","4":"Fishing Trip 123","title":"Fishing Trip 123","5":"1","uid":"1","6":"1","status":"1","7":"1239501752","created":"1239501752","8":"1239501752","changed":"1239501752","9":"0","comment":"0","10":"0","promote":"0","11":"0","moderate":"0","12":"0","sticky":"0","13":"0","tnid":"0","14":"0","translate":"0","15":"25","16":"25","17":"1998-10-31 00:00:00","field_stop_value":"1998-10-31 00:00:00","18":"2013-10-31 00:00:00","field_start_value":"2013-10-31 00:00:00"})
-->