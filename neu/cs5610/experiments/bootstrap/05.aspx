<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Collapsable Navbar Links</title>
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

        <div class="row alerts">
            <div class="col-md-12">
                <div class="alert alert-success">Successful alert</div>
                <div class="alert alert-info">Informational alert</div>
                <div class="alert alert-warning">Warning alert</div>
                <div class="alert alert-danger">Danger alert</div>
            </div>
        </div>

        <div class="row profile">
            <div class="col-md-12">
                <h1>Alerts</h1>
                <p>
                    Let's declare some alerts we might need later to show some messages.
                    We'll hide them in the next experiment and only show them when we need them.
                </p>
            </div>
        </div>

        <div class="row apps">
            <div class="col-md-12">
                <h2>Applications</h2>
                <p>
                    This is another row. We will use this row to render the user's applications.
                </p>
            </div>
        </div>

        <div class="row apps">
            <div class="col-md-12">
                <h2>Documentation</h2>
                <pre>
&lt;div class=&quot;alert alert-success&quot;&gt;Successful alert&lt;/div&gt;
&lt;div class=&quot;alert alert-info&quot;&gt;Informational alert&lt;/div&gt;
&lt;div class=&quot;alert alert-warning&quot;&gt;Warning alert&lt;/div&gt;
&lt;div class=&quot;alert alert-danger&quot;&gt;Danger alert&lt;/div&gt;</pre>

                <h2>Source</h2>
                <ul>
                    <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/05.aspx">ASPX Source</a></li>
                    <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/05.aspx.cs">C# Source</a></li>
                </ul>
            </div>
        </div>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
