<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sticky Header</title>
    <link type="text/css" rel="stylesheet" href="../../../css/bootstrap.min.css" />

    <!-- TODO: move this style tag to ~css/style.css -->
    <style>
        .main.container {
            /* push main container down to make room for sticky nav bar */
            margin-top : 50px;
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
            </div>
        </div>
    </div>

    <!-- Here's the main container. We'll distinguish it from the nav container with .main -->
    <div class="main container">

        <h1>Sticky Header</h1>

        <p>

        </p>

        <h2>Source</h2>

       	<a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/01.aspx">ASPX Source</a>

    </div>
    </form>

    <script src="../../../javascript/jquery-2.0.3.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
