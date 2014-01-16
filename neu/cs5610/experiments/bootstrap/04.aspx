<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Collapsable Navbar Links</title>
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

        <!-- Use rows and columns to organize your content -->
        <div class="row profile">
            <div class="col-md-12">
                <h1>Rows and Columns</h1>
                <p>
                    Use Bootstrap's rows and columns to organize your content.
                    This will make your content responsive and friendly to various types of devices.
                    This content is inside a column that takes up the entire width of the container.
                    The single column is inside a row. Rows organize the content into vertical sections (rows).
                    Columns are used to split the page into vertical sections (columns).
                    Columns must add up to 12.
                    We will use this row for a user profile
                </p>
            </div>
        </div>

        <div class="row apps">
            <div class="col-md-12">
                <h2>Applications</h2>
                <p>
                    This is another row. We will use this row to render the user's applications.
                    Rows and columns in this page were added with the following snippet of code.
                </p>

                <pre>
&lt;div class=&quot;row apps&quot;&gt;
    &lt;div class=&quot;col-md-12&quot;&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

                <h2>Source</h2>
                <ul>
                    <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/04.aspx">ASPX Source</a></li>
                    <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/04.aspx.cs">C# Source</a></li>
                </ul>
            </div>
        </div>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
