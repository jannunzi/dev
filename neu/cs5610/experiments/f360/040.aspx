<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.flatly.css" />
    <link rel="stylesheet" type="text/css" href="~/css/f360.css" />
    <style>

        /* @new styled list of fish */
        .f360-page.f360-fish ul {
            position:relative;
            top:-10px;
        }
        .f360-page.f360-fish li {
            border-bottom: 1px solid beige;
            padding: 10px;
            cursor : pointer;
        }
        .f360-page.f360-fish li a {
            text-decoration:none;
        }
        .f360-page.f360-fish li:hover {
            background-color : #dde4e6;
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

            <li><a href="#login" data-target="f360-login" title="Login">Login</a></li>
            <li><a href="#trips" data-target="f360-trips" title="Trips">Trips</a></li>
            <li><a href="#fish"  data-target="f360-fish"  title="Fish">Fish</a></li>

          </ul>
        </div>
      </div>
    </div>

    <div class="container f360-page f360-login">

        <div role="form">
          <div class="form-group">
            <label for="f360-username">Username</label>
            <input type="text" class="form-control" id="f360-username" placeholder="Username"/>
          </div>
          <div class="form-group">
            <label for="f360-password">Password</label>
            <input type="password" class="form-control" id="f360-password" placeholder="Password"/>
          </div>
          <button class="btn btn-primary btn-block f360-login">Login</button>
        </div>
        <h2>Forms</h2>
        <p>
            Adding trip details
        </p>
    </div>

    <div class="f360-page f360-trips">
        <ul class="list-unstyled">
            <li>
                <a href="#">
                    <span>Trip 1</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 2</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 3</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 4</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 5</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 6</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 7</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 8</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 9</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 10</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 11</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Trip 12</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="container f360-page f360-trip f360-details">
        <div role="form">
          <div class="form-group">
            <label for="f360-trip-name">Trip Name</label>
            <input type="text" class="form-control" id="f360-trip-name" name="title" placeholder="Trip Name"/>
          </div>
          <div class="form-group">
            <label for="f360-trip-start-date">Start Date</label>
            <input type="date" class="form-control" id="f360-trip-start-date" name="field_start_value"/>
          </div>
          <div class="form-group">
            <label for="f360-trip-end-date">End Date</label>
            <input type="date" class="form-control" id="f360-trip-end-date" name="field_stop_value"/>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="nid" placeholder="nid"/>
          </div>
          <button class="btn btn-warning btn-block f360-fish">Fish</button>
          <button class="btn btn-success btn-block f360-save">Save</button>
          <button class="btn btn-danger btn-block f360-delete">Delete</button>
        </div>
    </div>

    <!-- @new added list of fish -->
    <div class="f360-page f360-fish">
        <ul class="list-unstyled">
            <li>
                <a href="#">
                    <span>Fish 1</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 2</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 3</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 4</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 5</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 6</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 7</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 8</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 9</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 10</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 11</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span>Fish 12</span>
                    <span class="pull-right">&#9654;</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="navbar navbar-default navbar-fixed-bottom">
    </div>

    <form id="form1" runat="server">
        <br />
        <div class="container">
            <rasala:FileView ID="fileView" runat="server" />
        </div>
    </form>
    <script src="../../javascript/jquery-min.js"></script>
    <script src="../../javascript/jquery-ui.min.js"></script>
    <script src="../../javascript/bootstrap.js"></script>
    <script>
        $(function () {

            $('.nav a').on('click', function () {
                $(".navbar-toggle").click();

                // show/hide the correct page
                var a = $(this);
                var dataTarget = a.attr("data-target");
                $('.f360-page').hide();
                $('.f360-page.' + dataTarget).show();

                // set the title of the page
                var title = a.attr("title");
                $(".navbar-brand").html(title);
            });

            $(".f360-page.f360-login button.f360-login").click(loginAction);
            $(".f360-page.f360-trips").on("click", "li", selectTripAction);

            // @new add fish event handler
            $(".f360-page.f360-trip button.f360-fish").click(showFishAction);

        });

        // @new
        function showFishAction() {
            $('.f360-page').hide();
            $('.f360-page.f360-fish').show();
        }

        function selectTripAction() {
            $('.f360-page').hide();
            $('.f360-page.f360-trip.f360-details').show();
        }

        function loginAction() {
            $('.f360-page').hide();
            $('.f360-page.f360-trips').show();
        }

    </script>
</body>
</html>
