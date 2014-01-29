<%@ Page Language="C#" %>

<!DOCTYPE html>

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

        <h1>Connected Boxes</h1>

        <div class="row">
            <div class="col-xs-3">
                <h2>Top</h2>
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

            <div class="col-xs-3">
                <h2>Bottom</h2>
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

            <div class="col-xs-3">
                <h2>Left</h2>
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

            <div class="col-xs-3">
                <h2>Right</h2>
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

        <h2>HTML</h2>

        <div class="row">
            <div class="col-lg-6">
                <h3>Top Connection</h3>
                <h4>HTML</h4>
                <pre>
&lt;div class=&quot;wam-cb wam-top&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>
                <h4>CSS</h4>
                <pre>
.wam-cb.wam-top .wam-top {
    display : block;
}</pre>

            </div>

            <div class="col-lg-6">
                
                <h3>Bottom Connection</h3>

                <h4>HTML</h4>

                <pre>
&lt;div class=&quot;wam-cb wam-bottom&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>

                <h4>CSS</h4>

                <pre>
.wam-cb.wam-bottom .wam-bottom {
    display : block;
}</pre>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                
                <h3>Left Connection</h3>

                <h4>HTML</h4>

                <pre>
&lt;div class=&quot;wam-cb wam-left&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>

                <h4>CSS</h4>

                <pre>
.wam-cb.wam-left .wam-left {
    display : block;
}</pre>

            </div>
            <div class="col-lg-6">

                <h3>Right Connection</h3>

                <h4>HTML</h4>

                <pre>
&lt;div class=&quot;wam-cb wam-right&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>

                <h4>CSS</h4>

                <pre>
.wam-cb.wam-right .wam-right {
    display : block;
}</pre>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <h3>Hide All Connections by Default</h3>

                <pre>
.wam-cb .wam-top,
.wam-cb .wam-bottom,
.wam-cb .wam-right,
.wam-cb .wam-left {
    display : none;
}</pre>
            </div>
        </div>
            

        <hr />

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
