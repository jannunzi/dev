<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00.aspx.cs" Inherits="experiments_bootstrap_00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Bootstrap</title>

    <!-- Link Bootstrap's CSS -->
    <link type="text/css" rel="stylesheet" href="../../../css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">

    <!-- Put your main content inside .container DIV -->
    <div class="container">

        <h1>Welcome to Bootstrap</h1>

        <p>
            This is the minimum file setup for Bootstrap.
            <ol>
                <li>
                    Donwload Bootstrap from <a href="http://getbootstrap.com/">http://getbootstrap.com/</a>
                    and copy to a local folder.
                </li>
                <li>
                    Link to Bootstrap's CSS
                    <pre>
&lt;head&gt;
    ...
    &lt;link type=&quot;text/css&quot; rel=&quot;stylesheet&quot; href=&quot;css/bootstrap.min.css&quot; /&gt;
    ...
&lt;/head&gt;</pre>
                </li>
                <li>
                    Use the container class in the top DIV
                    <pre>
&lt;div class=&quot;container&quot;&gt;
    ... put your content here ...
&lt;/div&gt;</pre>
                </li>
                <li>Load Bootstrap's JS
                    <pre>
&lt;script src=&quot;js/bootstrap.min.js&quot;&gt;&lt;/script&gt;</pre>
                </li>
            </ol>
            We'll use this file as the template for all other Bootstrap experiments.
        </p>

        <h2>Source</h2>

       	<a target="_blank" href="../../../fileview/Default.aspx?~/experiments/bootstrap/00.aspx">ASPX Source</a>

    </div>
    </form>

    <!-- Optionally load Bootstrap's JS and jQuery (optional) -->
    <script src="../../../javascript/jquery-2.0.3.js"></script>
    <script src="../../../javascript/bootstrap.min.js"></script>

</body>
</html>
