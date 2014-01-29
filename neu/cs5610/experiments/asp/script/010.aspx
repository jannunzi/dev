<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <style>
        /* these override wam.css just for this experiment */
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

        <h2>Triangles</h2>

        <div class="row">
            <div class="col-xs-3">
                <h3>Up</h3>
                &#9650; Entity: &amp;#9650;
            </div>
            <div class="col-xs-3">
                <h3>Down</h3>
                &#9660; Entity: &amp;#9660;
            </div>
            <div class="col-xs-3">
                <h3>Left</h3>
                &#9668; Entity: &amp;#9668;
            </div>
            <div class="col-xs-3">
                <h3>Right</h3>
                &#9658; Entity: &amp;#9658;
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-xs-6">
                <h2>Vertical Line</h2>
                <div class="wam-border-left wam-border-sm wam-height-50"></div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-left
            wam-border-sm
            wam-height-50&quot;&gt;
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-height-100 {
    height:100px;
}
.wam-height-50 {
    height:50px;
}</pre>
            </div>
            <div class="col-xs-6">
                <h2>Horizontal Line</h2>
                <div class="wam-border-top wam-border-sm wam-width-50"></div>
                <br />
                <br />
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-top
            wam-border-sm
            wam-width-50&quot;&gt;
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-width-100 {
    width:100px;
}
.wam-width-200 {
    width:200px;
}
.wam-width-50 {
    width:50px;
}</pre>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-lg-3">
                <h2>Up Arrow</h2>
                <div class="wam-border-left wam-border-sm wam-height-50">
                    <div style="position: relative;top: -14px;left: -8px;">&#9650;</div>
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-left
            wam-border-sm
            wam-height-50&quot;&gt;
  &lt;div style=&quot;position: relative;
              top: -14px;
              left: -8px;&quot;&gt;
       &amp;#9650;
  &lt;/div&gt;
&lt;/div&gt;</pre>
            </div>
            <div class="col-lg-3">
                <h2>Down Arrow</h2>

                <div class="wam-border-left wam-border-sm wam-height-50">
                    <div style="position: absolute;bottom: -14px;left: 9px;">&#9660;</div>
                </div>
            </div>
            <div class="col-lg-3">
                <h2>Left Arrow</h2>
                <div class="wam-border-top wam-border-sm wam-width-50">
                    <div style="position: relative;left: -12px;top: -11px;">&#9668;</div>
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-top
            wam-border-sm
            wam-width-50&quot;&gt;
  &lt;div style=&quot;position: relative;
              left: -12px;
              top: -11px;&quot;&gt;
       &amp;#9668;
  &lt;/div&gt;
&lt;/div&gt;</pre>
            </div>
            <div class="col-lg-3">
                <h2>Right Arrow</h2>
                <div class="wam-border-top wam-border-sm wam-width-50">
                    <div style="position: relative;left: 48px;top: -11px;">&#9658;</div>
                </div>
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-border-top
            wam-border-sm
            wam-width-50&quot;&gt;
  &lt;div style=&quot;position: relative;
              left: 48px;
              top: -11px;&quot;&gt;
       &amp;#9658;
  &lt;/div&gt;
&lt;/div&gt;</pre>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col-lg-12">
                <h2>Box With Arrows</h2>
                <div class="wam-border-all wam-border-md wam-position-absolute">
                    <div style="position: absolute;left: -16px;top: 50%;"><span style="position: relative;top: -6px;">&#9658;</span></div>
                    <div style="position: absolute;bottom: -18px;left: 50%;"><span style="position: relative;left: -6px;">&#9650</span></div>
                    <div style="position: absolute;top: -20px;left: 50%;"><span style="position: relative;left: -6px;">&#9660;</span></div>
                    <div style="position: absolute;top: 50%;right: -16px;"><span style="position: relative;top: -6px;">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />
                <br />

                <h3>HTML</h3>

<pre>
&lt;div class=&quot;wam-border-all wam-border-md wam-position-absolute&quot;&gt;
    &lt;div style=&quot;position: absolute;left: -16px;top: 50%;&quot;&gt;
        &lt;span style=&quot;position: relative;top: -6px;&quot;&gt;&amp;#9658;&lt;/span&gt;
    &lt;/div&gt;
    &lt;div style=&quot;position: absolute;bottom: -18px;left: 50%;&quot;&gt;
        &lt;span style=&quot;position: relative;left: -6px;&quot;&gt;&amp;#9650&lt;/span&gt;
    &lt;/div&gt;
    &lt;div style=&quot;position: absolute;top: -20px;left: 50%;&quot;&gt;
        &lt;span style=&quot;position: relative;left: -6px;&quot;&gt;&amp;#9660;&lt;/span&gt;
    &lt;/div&gt;
    &lt;div style=&quot;position: absolute;top: 50%;right: -16px;&quot;&gt;
        &lt;span style=&quot;position: relative;top: -6px;&quot;&gt;&amp;#9668;&lt;/span&gt;
    &lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>
            </div>
            <div class="col-lg-3">
            </div>
            <div class="col-lg-3">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
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
                <h3>HTML</h3>
                <pre>
&lt;div class=&quot;wam-cb wam-margin-20&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span style=&quot;...&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span style=&quot;...&quot;&gt;&amp;#9650;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span style=&quot;...&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span style=&quot;...&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>
                <h3>CSS</h3>
                <pre>
.wam-connected-box, .wam-cb {
    border : 1px solid black;
    border-width : 4px;
    position : relative;
    background-color : white;
    padding : 10px;
}
.wam-cb .wam-left {
    position: absolute;
    left: -20px;
    top: 50%;
}
.wam-cb .wam-right {
    position: absolute;
    top: 50%;
    right: -20px;
}
.wam-cb .wam-top {
    position: absolute;
    top: -24px;
    left: 50%;
}
.wam-cb .wam-bottom {
    position: absolute;
    bottom: -24px;
    left: 50%;
}</pre>
            </div>
            <div class="col-lg-6">
                <h2 class="wam-margin-20">Factoring Out</h2>

                <p>Here we moved all styling from the HTML markup to the CSS file wam.css</p>

                <div class="wam-cb wam-margin-20">
                    <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
                    <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
                    <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
                    <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
                    <div class="wam-content">
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                
                <h3>HTML</h3>

                <pre>
&lt;div class=&quot;wam-cb wam-margin-20&quot;&gt;
    &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
    &lt;div class=&quot;wam-content&quot;&gt;
        ...
    &lt;/div&gt;
&lt;/div&gt;</pre>

                <h3>CSS</h3>

                <pre>
.wam-cb .wam-bottom .wam-arrow {
    position: relative;
    left: -8px;
    font-size: 20px;
}
.wam-cb .wam-left .wam-arrow {
    position: relative;
    top: -13px;
    font-size: 20px;
}
.wam-cb .wam-top .wam-arrow {
    position: relative;
    left: -11px;
    font-size: 20px;
}
.wam-cb .wam-right .wam-arrow {
    position: relative;
    top: -13px;
    font-size: 20px;
}</pre>

            </div>
        </div>

        <hr />

        <h2>Use Prof. Rasala's File View Control</h2>
        <p>
            Use attribute MarkupText to override the link's text. e.g.,
            <code>MarkupText="View this file's source code"</code>.
            Below is an example that renders the link that follows:
        </p>
        <code>&lt;rasala:FileView ID=&quot;fileView&quot; runat=&quot;server&quot; MarkupText=&quot;View this file&apos;s source code&quot; /&gt;</code>
        <br /><br />
        <rasala:FileView ID="fileView" runat="server" MarkupText="View this file's source code" />
    </div>
    </form>
</body>
</html>
