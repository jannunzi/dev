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
        <h1>DIV Borders</h1>

        <div class="row">
            <div class="col-sm-3">
                <h2>Extra Small</h2>
                <div class="wam-border-all wam-border-xs">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>
&lt;div class=&quot;wam-border-all
            wam-border-xs&quot;&gt;
    ...
&lt;/div&gt;</pre>
            </div>
            <div class="col-sm-3">
                <h2>Small</h2>
                <div class="wam-border-all wam-border-sm">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>Medium</h2>
                <div class="wam-border-all wam-border-md">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>Large</h2>
                <div class="wam-border-all wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <h2>Top X-Small</h2>
                <div class="wam-border-top wam-border-xs">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>Bottom Small</h2>
                <div class="wam-border-bottom wam-border-sm">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>Right Medium</h2>
                <div class="wam-border-right wam-border-md">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>Left Large</h2>
                <div class="wam-border-left wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <h2>No Left</h2>
                <div class="wam-border-no-left wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>No Right</h2>
                <div class="wam-border-no-right wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>No Top</h2>
                <div class="wam-border-no-top wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
            <div class="col-sm-3">
                <h2>No Bottom</h2>
                <div class="wam-border-no-bottom wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <br />
                <pre>

                </pre>
            </div>
        </div>

        <br/>
        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
