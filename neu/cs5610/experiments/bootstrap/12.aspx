<%@ Page Language="C#" AutoEventWireup="true" CodeFile="12.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation</title>
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

        <h1>Navigation</h1>

        <div class="row">

            <div class="col-sm-12">
                <ol class="breadcrumb">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Library</a></li>
                  <li class="active">Data</li>
                </ol>
            </div>
        </div>

        <div class="row">
          <div class="col-sm-8">
              <h3>Tabs</h3>

                <ul class="nav nav-tabs">
                  <li class="active"><a href="#">Home</a></li>
                  <li><a href="#">Profile</a></li>
                  <li><a href="#">Messages</a></li>
                </ul>

          </div>
          <div class="col-sm-4">
              <h3>Pills</h3>

                <ul class="nav nav-pills">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Messages</a></li>
                </ul>

          </div>
        </div>

        <div class="row">
          <div class="col-sm-4">
              <h3>Stacked Pills</h3>

                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Messages</a></li>
                </ul>

          </div>
          <div class="col-sm-4">
              <h3>Dropdowns</h3>

                <ul class="nav nav-tabs">
                  <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                      Dropdown <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>ewq1</li>
                        <li>ewq2</li>
                        <li>ewq3</li>
                    </ul>
                  </li>
                </ul>

          </div>
          <div class="col-sm-4">
              <h3>Pagination</h3>
                <ul class="pagination">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li class="active"><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
          </div>
        </div>

    </div> <!-- .main.container -->
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
