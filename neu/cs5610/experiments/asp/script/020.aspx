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

        <h1>Vertically Connected Boxes</h1>

        <div class="row">
            <div class="col-xs-3">

                <h2>Top Connection</h2>

                <div class="wam-cb">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

                <div class="wam-cb wam-top">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

                <div class="wam-cb wam-top">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <div class="wam-line-vertical-middle wam-height-50"></div>

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
            <div class="col-xs-9">
                <h2>HTML</h2>
                <pre>
&lt;div class=&quot;wam-cb&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;wam-line-vertical-middle wam-height-50&quot;&gt;&lt;/div&gt;

&lt;div class=&quot;wam-cb wam-top&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>
                
                <h2>CSS</h2>

                <pre>
.wam-line-vertical-middle {
    width : 50%;
    border-right : 2px solid black;
}</pre>

            </div>
        </div>

        <br />

        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>
</body>
</html>
