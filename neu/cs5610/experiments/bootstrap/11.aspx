<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wells, Labels and Badges</title>
    <link type="text/css" rel="stylesheet" href="../../../css/bootstrap.min.css" />

    <!-- TODO: move this style tag to ~css/style.css -->
    <style>
        body {
            padding-top : 45px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">WAM</a>
            </div> <!-- navbar-header -->

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#about">Profile</a></li>
                    <li><a href="#contact">Apps</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Links <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="themes">
                            <li><a tabindex="-1" href="http://getbootstrap.com/" target="_blank">Get Bootsrap</a></li>
                            <li><a tabindex="-1" href="http://bootswatch.com/" target="_blank">Bootswatch</a></li>
                            <li><a tabindex="-1" href="http://bootsnipp.com/" target="_blank">Bootsnip</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

        </div> <!-- container -->
    </div>

    <div class="main container">

        <h1>Wells, Labels and Badges</h1>

        <!-- Use rows and columns to organize your content -->
        <div class="row">
          <div class="col-sm-8">
              <h3>Large Wells</h3>

              <div class="well well-lg">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
              </div>

          </div>
          <div class="col-sm-4">
              <h3>Small Wells</h3>

              <div class="well well-sm">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
              </div>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-4">
              <h3>Labels</h3>
                <span class="label label-default">Default</span>
                <span class="label label-primary">Primary</span>
                <span class="label label-success">Success</span>
                <span class="label label-info">Info</span>
                <span class="label label-warning">Warning</span>
                <span class="label label-danger">Danger</span>
          </div>
          <div class="col-sm-4">
              <h1>Labels in <span class="label label-default">Headers</span></h1>
              <h2>Labels in <span class="label label-default">Headers</span></h2>
              <h3>Labels in <span class="label label-default">Headers</span></h3>

          </div>
          <div class="col-sm-4">
              <h3>Different Devices</h3>
              Medium is intended for desktops with screens larger than 970 pixels.
              Small is intended for tablet devices with screens larger than 750
              pixels. Extra small is intended for phones with screen widths
              less than 750 pixels.
          </div>
        </div>

        <div class="row">
          <div class="col-sm-6">
              <h3>Badges</h3>
                <ul class="nav nav-pills">
                    <li class="active"><a href="#">Home <span class="badge">42</span></a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Messages <span class="badge">3</span></a></li>
                </ul>

                  <br />
                  <a href="#">Inbox <span class="badge">123</span></a>
                  <br/>
                  <a href="#">Likes <span class="badge">234</span></a>
                  <br/>
                  <a href="#">Unlikes <span class="badge"></span></a>

          </div>
          <div class="col-sm-6">
              <h3>More Badges</h3>

                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                    <a href="#">
                        <span class="badge pull-right">42</span>
                        Home
                    </a>
                    </li>
                    <li class="active">
                    <a href="#">
                        Home
                        <span class="badge">42</span>
                    </a>
                    </li>
                </ul>
          </div>
        </div>

        <hr />

        <div class="row">
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
          <div class="col-sm-1">.col-sm-1</div>
        </div>

    </div> <!-- .main.container -->
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
