<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.flatly.css" />
    <link rel="stylesheet" type="text/css" href="~/css/f360.css" />
    <style>
        ul li {
            padding: 10px;
            border-bottom: 1px solid beige;

        }
        ul li:hover {
            background-color : lightblue;
        }
    </style>
</head>
<body>

    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="#" class="navbar-brand">Login</a>
          <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar-main">
            <!-- These are the 3 bars on the right hand side of the nav bar to toggle the menu -->
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main" style="height: 1px;">
          <ul class="nav navbar-nav">
            <li><a href="#login">Login</a></li>
            <li><a href="#trips">Trips</a></li>
            <li><a href="#fish">Fish</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container f360-page f360-login">

        <div role="form">
          <div class="form-group">
            <label for="f360-username">Username</label>
            <input type="text" class="form-control" id="f360-username" placeholder="Username" value="jsilva"/>
          </div>
          <div class="form-group">
            <label for="f360-password">Password</label>
            <input type="password" class="form-control" id="f360-password" placeholder="Password"/>
          </div>
          <button class="btn btn-primary btn-block f360-login">Login</button>
        </div>

    </div>

    <div class="f360-page f360-trip f360-list">

        <div class="container">
            <button class="btn btn-primary btn-block">Add New Trip</button>
        </div>

        <ul class="list-unstyled">
            <li>
                <span class="f360-title">Trip 1</span>
                <span class="f360-title pull-right">&#9654;</span>
            </li>
            <li>
                <span class="f360-title">Trip 1</span>
                <span class="f360-title pull-right">&#9654;</span>
            </li>
            <li>
                <span class="f360-title">Trip 1</span>
                <span class="f360-title pull-right">&#9654;</span>
            </li>
            <li>
                <span class="f360-title">Trip 1</span>
                <span class="f360-title pull-right">&#9654;</span>
            </li>
            <li>
                <span class="f360-title">Trip 1</span>
                <span class="f360-title pull-right">&#9654;</span>
            </li>
        </ul>
    </div>

    <div class="container f360-page f360-trip f360-details">
        <h2>Trip Details</h2>
    </div>

    <div class="container f360-page f360-fish f360-list">
        <h2>Fish</h2>
    </div>

    <div class="container f360-page f360-fish f360-details">
        <h2>Fish Details</h2>
    </div>


    <div class="navbar navbar-default navbar-fixed-bottom">
    </div>


    <form id="form1" runat="server">
    <div class="container">
        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../javascript/jquery-min.js"></script>
    <script src="../../javascript/jquery-ui.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(function () {

            // event handlers
            $(".navbar-nav a").click(closeNavMenu);
            $("button.f360-login").click(loginAction);


        });

        function hidePage(pageSelector) {
            if (typeof pageSelector === "undefined") {
                $(".f360-page").hide();
            }
            $(pageSelector).hide();
        }

        function showPage(pageSelector) {
            if (typeof pageSelector === "string") {
                var page = $(pageSelector);
                if(page.length > 0)
                    page.show();
            }
        }

        function loginAction() {
            var username = $("#f360-username").val();
            getTripsService(username, renderTripList);
        }

        var template = null;
        function renderTripList(listOfTrips) {
            if (template === null) {
                template = $(".f360-page.f360-trip.f360-list ul li:first");
            }
            var container = $(".f360-page.f360-trip.f360-list ul");
            container.empty();
            console.log(listOfTrips);
            for (var t = 0; t < listOfTrips.length; t++) {
                var trip = listOfTrips[t];
                var instance = template.clone();
                container.append(instance);
            }
            hidePage();
            showPage(".f360-page.f360-trip.f360-list");
        }

        function getTripsService(username, callback) {
            $.ajax({
                url: "http://dev.fish360.net/autotideapp/services/GetAllFishingTripsForUser.php",
                data: { username: username },
                dataType: "jsonp",
                success: function (response) {
                    if (typeof callback === "function") {
                        callback(response);
                    }
                }
            });
        }

        function closeNavMenu() {
            $("button.navbar-toggle").click();
        }
    </script>
</body>
</html>
