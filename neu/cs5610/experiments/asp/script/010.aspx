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
    <style>
        .wam-cb .wam-top,
        .wam-cb .wam-bottom,
        .wam-cb .wam-right,
        .wam-cb .wam-left {
            display : block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Triangle Entities and Arrows</h1>

        <div class="row">
            <div class="col-sm-3">
                <h2>Up Triangle</h2>
                &#9650; Entity: &amp;#9650;
            </div>
            <div class="col-sm-3">
                <h2>Down Triangle</h2>
                &#9660; Entity: &amp;#9660;
            </div>
            <div class="col-sm-3">
                <h2>Left Triangle</h2>
                &#9668; Entity: &amp;#9668;
            </div>
            <div class="col-sm-3">
                <h2>Right Triangle</h2>
                &#9658; Entity: &amp;#9658;
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <h2>Vertical Line</h2>
                <div class="wam-border-left wam-border-sm wam-height-50"></div>
            </div>
            <div class="col-sm-3">
                <h2>Horizontal Line</h2>
                <div class="wam-border-top wam-border-sm wam-width-50"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <h2>Up Arrow</h2>
                <div class="wam-border-left wam-border-sm wam-height-50">
                    <div style="position: relative;top: -14px;left: -8px;">&#9650;</div>
                </div>
            </div>
            <div class="col-sm-3">
                <h2>Down Arrow</h2>
                <div class="wam-border-left wam-border-sm wam-height-50">
                    <div style="position: absolute;bottom: -14px;left: 9px;">&#9660;</div>
                </div>
            </div>
            <div class="col-sm-3">
                <h2>Left Arrow</h2>
                <div class="wam-border-top wam-border-sm wam-width-50">
                    <div style="position: relative;left: -12px;top: -11px;">&#9668;</div>
                </div>
            </div>
            <div class="col-sm-3">
                <h2>Right Arrow</h2>
                <div class="wam-border-top wam-border-sm wam-width-50">
                    <div style="position: relative;left: 48px;top: -11px;">&#9658;</div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <h2>Box With Arrows</h2>
                <div class="wam-border-all wam-border-md wam-position-absolute">
                    <div style="position: absolute;left: -16px;top: 50%;"><span style="position: relative;top: -6px;">&#9658;</span></div>
                    <div style="position: absolute;bottom: -18px;left: 50%;"><span style="position: relative;left: -6px;">&#9650</span></div>
                    <div style="position: absolute;top: -20px;left: 50%;"><span style="position: relative;left: -6px;">&#9660;</span></div>
                    <div style="position: absolute;top: 50%;right: -16px;"><span style="position: relative;top: -6px;">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <h2 class="wam-margin-20">Connected Box</h2>
                <div class="wam-cb wam-margin-20">
                    <div class="wam-left"><span style="position: relative;top: -6px;">&#9658;</span></div>
                    <div class="wam-bottom"><span style="position: relative;left: -6px;">&#9650</span></div>
                    <div class="wam-top"><span style="position: relative;left: -6px;">&#9660;</span></div>
                    <div class="wam-right"><span style="position: relative;top: -6px;">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <h2 class="wam-margin-20">Styles</h2>
                <div class="wam-cb wam-margin-20">
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
