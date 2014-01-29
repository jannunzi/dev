<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
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
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-all
            wam-border-xs&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-xs {
    border-width : 1px;
}
.wam-border-all {
    border : 1px solid black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Small</h2>
                <div class="wam-border-all wam-border-sm">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-all
            wam-border-sm&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-sm {
    border-width : 2px;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Medium</h2>
                <div class="wam-border-all wam-border-md">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-all
            wam-border-md&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-md {
    border-width : 4px;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Large</h2>
                <div class="wam-border-all wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-all
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-lg {
    border-width : 8px;
}</pre>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-sm-3">
                <h2>Top X-Small</h2>
                <div class="wam-border-top wam-border-xs">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-top
            wam-border-xs&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-top {
    border-top-style : solid;
    border-top-color : black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Bottom Small</h2>
                <div class="wam-border-bottom wam-border-sm">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-bottom
            wam-border-sm&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-bottom {
    border-bottom-style : solid;
    border-bottom-color : black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Right Medium</h2>
                <div class="wam-border-right wam-border-md">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-right
            wam-border-md&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-right {
    border-right-style : solid;
    border-right-color : black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>Left Large</h2>
                <div class="wam-border-left wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-left
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-left {
    border-left-style : solid;
    border-left-color : black;
}</pre>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-sm-3">
                <h2>No Left</h2>
                <div class="wam-border-no-left wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-no-left
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-no-left {
    border-top-style : solid;
    border-top-color : black;
    border-right-style : solid;
    border-right-color : black;
    border-bottom-style : solid;
    border-bottom-color : black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>No Right</h2>
                <div class="wam-border-no-right wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-no-right
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-no-right {
    border-top-style : solid;
    border-top-color : black;
    border-left-style : solid;
    border-left-color : black;
    border-bottom-style : solid;
    border-bottom-color : black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>No Top</h2>
                <div class="wam-border-no-top wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-no-top
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-no-top {
    border-left-style: solid;
    border-left-color: black;
    border-right-style: solid;
    border-right-color: black;
    border-bottom-style: solid;
    border-bottom-color: black;
}</pre>
            </div>
            <div class="col-sm-3">
                <h2>No Bottom</h2>
                <div class="wam-border-no-bottom wam-border-lg">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-no-bottom
            wam-border-lg&quot;&gt;
    ...
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-border-no-bottom {
    border-left-style: solid;
    border-left-color: black;
    border-right-style: solid;
    border-right-color: black;
    border-top-style: solid;
    border-top-color: black;
}</pre>
            </div>
        </div>

        <hr />

        <h2>Use Prof. Rasala's File View Control</h2>
        <code>&lt;rasala:FileView ID=&quot;fileView&quot; runat=&quot;server&quot; /&gt;</code>
        <br/>
        <br/>
        <rasala:FileView ID="fileView" runat="server" />
        <code>&lt;rasala:FileView ID=&quot;fileView1&quot; TildeFilePath=&quot;~/css/wam.css&quot; runat=&quot;server&quot; /&gt;</code>
        <br />
        <br />
        <rasala:FileView ID="fileView1" TildeFilePath="~/css/wam.css" runat="server" />
    </div>
    </form>
</body>
</html>
