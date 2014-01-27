<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Boxes and Arrows</h1>

        <div class="row">
            <div class="col-sm-3">
                <h2>Top Connection</h2>
                <div class="wam-cb wam-top">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <h2>Bottom Connection</h2>
                <div class="wam-cb wam-bottom">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <h2>Left Connection</h2>
                <div class="wam-cb wam-left">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <h2>Right Connection</h2>
                <div class="wam-cb wam-right">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>
        </div>

        <br />

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
