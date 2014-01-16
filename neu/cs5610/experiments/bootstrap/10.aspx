<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grids</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css" />

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

        <h1>Targetting Mobile, Tablets, and Desktops</h1>

        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-8">
              <h3>.col-xs-12 .col-sm-6 .col-md-8</h3>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </div>
          <div class="col-xs-6 col-md-4">
              <h3>.col-xs-6 .col-md-4</h3>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
          </div>
        </div>
        <hr />
        <div class="row">
          <div class="col-xs-6 col-sm-4">
              <h3>.col-xs-6 .col-sm-4</h3>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
          </div>
          <div class="col-xs-6 col-sm-4">
              <h3>.col-xs-6 .col-sm-4</h3>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
          </div>
          <!-- Optional: clear the XS cols if their content doesn't match in height -->
          <div class="clearfix visible-xs"></div>
          <div class="col-xs-6 col-sm-4">
              <h3>.col-xs-6 .col-sm-4</h3>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
          </div>
        </div>

    </div> <!-- .main.container -->
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
