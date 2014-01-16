<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03.aspx.cs" Inherits="experiments_bootstrap_00" %>

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

                    <!-- Collapsable List of links in the top navigation bar -->
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

        <h1>Collapsable Navbar Links</h1>

        <p>
            Add collapsable navigation links to your top navigation bar with the following snippet
        </p>

        <pre>
&lt;li class=&quot;dropdown&quot;&gt;
    &lt;a class=&quot;dropdown-toggle&quot; data-toggle=&quot;dropdown&quot; href=&quot;#&quot;&gt;Links &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;&lt;/a&gt;
    &lt;ul class=&quot;dropdown-menu&quot; aria-labelledby=&quot;themes&quot;&gt;
        &lt;li&gt;&lt;a tabindex=&quot;-1&quot; href=&quot;http://bootswatch.com/&quot; target=&quot;_blank&quot;&gt;Bootswatch&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a tabindex=&quot;-1&quot; href=&quot;http://bootsnipp.com/&quot; target=&quot;_blank&quot;&gt;Bootsnip&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/li&gt;</pre>
        <h2>Source</h2>
        <ul>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/03.aspx">ASPX Source</a></li>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/03.aspx.cs">C# Source</a></li>
        </ul>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
