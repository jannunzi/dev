<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.flatly.css" />
    <link rel="stylesheet" type="text/css" href="~/css/f360.css" />
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

        <!-- @new -->
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

    </div>

    <div class="container f360-page f360-trips">
        <h2>Trips Page</h2>
    </div>

    <div class="container f360-page f360-fish">
        <h2>Fish Page</h2>
    </div>

    <!-- @new -->
    <div class="container">
        <h2>Forms</h2>
        <p>
            This experiment shows adding forms.
        </p>
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

            // @new
            $(".f360-page.f360-login button.f360-login").click(loginAction);

        });

        // @new
        function loginAction() {
            $('.f360-page').hide();
            $('.f360-page.f360-trips').show();
        }

    </script>
</body>
</html>
