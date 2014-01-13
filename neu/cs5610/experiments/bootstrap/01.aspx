<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sticky Header</title>
    <link type="text/css" rel="stylesheet" href="../../../css/bootstrap.min.css" />

    <!-- TODO: move this style tag to ~css/style.css -->
    <style>
        body {
            /* pad body to make room for sticky nav bar */
            padding-top : 45px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

    <!-- Add a sticky navigation bar at the top -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">WAM</a>
            </div> <!-- navbar-header -->
        </div> <!-- container -->
    </div>

    <!-- Here's the main container. We'll distinguish it from the nav container with .main -->
    <div class="main container">

        <h1>Sticky Header</h1>

        <p>
            Add a sticky header like the one above with the following code
        </p>

        <pre>
&lt;div class=&quot;navbar navbar-inverse navbar-fixed-top&quot; role=&quot;navigation&quot;&gt;
    &lt;div class=&quot;container&quot;&gt;
        &lt;div class=&quot;navbar-header&quot;&gt;
            &lt;a class=&quot;navbar-brand&quot; href=&quot;#&quot;&gt;WAM&lt;/a&gt;
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;</pre>

        <h2>Source</h2>
        <ul>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/01.aspx">ASPX Source</a></li>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/01.aspx.cs">C# Source</a></li>
        </ul>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
