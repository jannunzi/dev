<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navbar Links</title>
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

            <!-- List of links in the top navigation bar -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#about">Profile</a></li>
                    <li><a href="#contact">Apps</a></li>
                </ul>
            </div>

        </div> <!-- container -->
    </div>

    <div class="main container">

        <h1>Navbar Links</h1>

        <p>
            Add navigation links to your top navigation bar with the following snippet
        </p>

        <pre>
&lt;div class=&quot;collapse navbar-collapse&quot;&gt;
    &lt;ul class=&quot;nav navbar-nav&quot;&gt;
        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Home&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href=&quot;#about&quot;&gt;Profile&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href=&quot;#contact&quot;&gt;Apps&lt;/a&gt;&lt;/li&gt;
    &lt;/ul&gt;
&lt;/div&gt;</pre>
        <h2>Source</h2>
        <ul>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/02.aspx">ASPX Source</a></li>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/02.aspx.cs">C# Source</a></li>
        </ul>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.min.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
