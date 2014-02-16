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

    <!-- @new -->
    <div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="#" class="navbar-brand">f360</a>
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

    <div class="container">
        <h1>Responsive Nav Menu</h1>
    </div>

    <div class="navbar navbar-default navbar-fixed-bottom">
    </div>

    <form id="form1" runat="server">
        <rasala:FileView ID="fileView" runat="server" />
    </form>
    <script src="../../javascript/jquery-min.js"></script>
    <script src="../../javascript/jquery-ui.min.js"></script>
    <script src="../../javascript/bootstrap.js"></script>
    <script>
        $(function () {

            // @new
            $('.nav a').on('click', function () {
                $(".navbar-toggle").click();
            });

        });
    </script>
</body>
</html>
