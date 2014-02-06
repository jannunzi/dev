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

                <h2>Get All Fish for Trip Node Id</h2>

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=25"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=25</a>

                <br />

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=88"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=88</a>

                <br />

                <a  href="http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=5"
                    target="_blank">http://dev.fish360.net/autotideapp/services/GetAllFishForFishingTrip.php?fishingTripNodeId=5</a>

                <br />


                <pre>
[
    {
        nid: "467",
        vid: "467",
        type: "fish_type",
        language: "en",
        title: "Fish 123",
        uid: "0",
        status: "1",
        created: "1375018607",
        changed: "1375018607",
        comment: "0",
        promote: "0",
        moderate: "0",
        sticky: "0",
        tnid: "0",
        translate: "0",
        field_sky_value: "sky3333344444444",
        field_wind_value: "wind2",
        field_clarity_value: "some clarity",
        field_rod_value: "TB2 Rod 1",
        field_reel_value: "Reel1",
        field_leader_value: "50 in Line2",
        field_rig_value: "TB2 Rig 1",
        field_species_value: "",
        field_bait_value: "Clams",
        field_girth_value: "567",
        field_time_value: "2009-07-08 20:24:00",
        field_depth_value: "456",
        field_temperature_value: "345",
        field_pressure_value: "2222",
        field_fishing_trip_nid: "25",
        field_hot_spot_value: "",
        field_weight_lbs_value: "321321"
    },
    {
        nid: "403",
        vid: "403",
        type: "fish_type",
        language: "en",
        title: "Fish 567",
        uid: "1",
        status: "1",
        created: "1370715497",
        changed: "1370715497",
        comment: "0",
        promote: "0",
        moderate: "0",
        sticky: "0",
        tnid: "0",
        translate: "0",
        field_sky_value: "sky3",
        field_wind_value: "wind2",
        field_clarity_value: "some clarity",
        field_rod_value: "Rod 5",
        field_reel_value: "",
        field_leader_value: "",
        field_rig_value: "",
        field_species_value: "Species 123",
        field_bait_value: "",
        field_girth_value: "567",
        field_time_value: "2009-07-09 00:00:00",
        field_depth_value: "456",
        field_temperature_value: "345",
        field_pressure_value: "234",
        field_fishing_trip_nid: "25",
        field_hot_spot_value: "",
        field_weight_lbs_value: "123456"
    },
    ...
]
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
