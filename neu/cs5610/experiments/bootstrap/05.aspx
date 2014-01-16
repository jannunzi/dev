<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05.aspx.cs" Inherits="experiments_bootstrap_00" %>

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

        <h1>Grid Systems (Large)</h1>

        <!-- Use rows and columns to organize your content -->
        <div class="row">
          <div class="col-lg-8">
              <h3>Rows</h3>
              Bootstrap grids allow laying out pages in terms of horizontal
              grids and vertical rows. Each row is composed of 12 eaqual width columns.
              Bootstrap declares several column classes that configure the
              width of the columns. For each row, column widths must add up to 12.
              For instance this column has column class .col-lg-8 and the column
              immediately to the right of this column has class .col-lg-4.
          </div>
          <div class="col-lg-4">
              <h3>Columns</h3>
              The 8 and 4 add up to 12. This column has column class .col-lg-4.
              Together with the column to the left, adds up to 12.
          </div>
        </div>

        <div class="row">
          <div class="col-lg-4">
              <h3>Three Columns</h3>
              These three columns are using class .col-lg-4, so that 4 x 3 columns = 12.
              The md in the class name refers to 'medium'. Other alternative column
              class names would be .col-xs-4 and .col-lg-4 where xs stands for
              'extra small' and 'large'.
          </div>
          <div class="col-lg-4">
              <h3>Different Sizes</h3>
              Extra small, medium, and large refer to the intended target device
              screen width. Together they define several break points where the
              styles take effect. For instance, large is intended for desktops
              with large screens of 1170 pixels.
          </div>
          <div class="col-lg-4">
              <h3>Different Devices</h3>
              Medium is intended for desktops with screens larger than 970 pixels.
              Small is intended for tablet devices with screens larger than 750
              pixels. Extra small is intended for phones with screen widths
              less than 750 pixels.
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6">
              <h3>Responsive</h3>
              These two columns have class .col-lg-6 so they have the same
              width. The rows and columns are responsive and friendly to
              various types of devices. As you resize the Web page, the
              columns and rows reposition to adapt to the new width of the
              Web page.
          </div>
          <div class="col-lg-6">
              <h3>Smaller Devices</h3>
              As you resize the Web page the columns resize to stack so they
              make better use of the page width in smaller devices.
          </div>
        </div>

        <hr />

        <div class="row">
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
          <div class="col-lg-1">.col-lg-1</div>
        </div>

    </div> <!-- .main.container -->
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
