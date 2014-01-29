<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <style>
        ul.wam-script {
            padding : 0px;
        }
        #new button {
            position : relative;
            top: -4px;
            right: -3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Connected Boxes Editor</h1>

        <div class="row">
            <div class="col-md-3">
                <h2>Editor</h2>

<ul class="wam-no-bullets wam-script">
<%
int counter = 0;
foreach(object param in Request.Params) {
  if (param.ToString().StartsWith("wam")) {
    string value = Request.Params[param.ToString()];
    if (value == "" || value.Length == 0)
      continue;
%>  <li>
      <div class="wam-cb wam-top" id="<%= counter %>">
        <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
        <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
        <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
        <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
        <div class="wam-content">
          <%= counter %>
          <input class="wam-width-90-pct wam-shadow-border wam-no-borders"
                 type="text" name="wam-<%= counter %>" value="<%= value %>"/>
        </div>
      </div>

      <div class="wam-line-vertical-middle wam-height-50"></div>
    </li>
<%  counter++;
  }
}%>
  <li>
    <div class="wam-cb wam-top" id="new">
      <div class="wam-left"><span class="wam-arrow">&#9658;</span></div>
      <div class="wam-bottom"><span class="wam-arrow">&#9650</span></div>
      <div class="wam-top"><span class="wam-arrow">&#9660;</span></div>
      <div class="wam-right"><span class="wam-arrow">&#9668;</span></div>
      <div class="wam-content">
        <input type="text" name="wam-new-line" autofocus="autofocus"
               class="wam-no-borders wam-shadow-border wam-width-70-pct" />
        <button class="btn btn-success btn-sm pull-right">&plus;</button>
      </div>
    </div>
  </li>
</ul>
            </div>

            <div class="col-md-9">
                <h2>Source Code</h2>
                <pre>
&lt;ul class=&quot;wam-no-bullets wam-script&quot;&gt;
&lt;%
int counter = 0;
foreach(object param in Request.Params) {
  if (param.ToString().StartsWith(&quot;wam&quot;)) {
    string value = Request.Params[param.ToString()];
    if (value == &quot;&quot; || value.Length == 0)
      continue;
%&gt;  &lt;li&gt;
      &lt;div class=&quot;wam-cb wam-top&quot; id=&quot;&lt;%= counter %&gt;&quot;&gt;
        &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
        &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
        &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
        &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
        &lt;div class=&quot;wam-content&quot;&gt;
          &lt;%= counter %&gt;
          &lt;input class=&quot;wam-width-200 wam-shadow-border wam-no-borders&quot;
                 type=&quot;text&quot; name=&quot;wam-&lt;%= counter %&gt;&quot; value=&quot;&lt;%= value %&gt;&quot;/&gt;
        &lt;/div&gt;
      &lt;/div&gt;

      &lt;div class=&quot;wam-line-vertical-middle wam-height-50&quot;&gt;&lt;/div&gt;
    &lt;/li&gt;
&lt;%  counter++;
  }
}%&gt;
  &lt;li&gt;
    &lt;div class=&quot;wam-cb wam-top&quot; id=&quot;new&quot;&gt;
      &lt;div class=&quot;wam-left&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9658;&lt;/span&gt;&lt;/div&gt;
      &lt;div class=&quot;wam-bottom&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9650&lt;/span&gt;&lt;/div&gt;
      &lt;div class=&quot;wam-top&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9660;&lt;/span&gt;&lt;/div&gt;
      &lt;div class=&quot;wam-right&quot;&gt;&lt;span class=&quot;wam-arrow&quot;&gt;&amp;#9668;&lt;/span&gt;&lt;/div&gt;
      &lt;div class=&quot;wam-content&quot;&gt;
        &lt;input type=&quot;text&quot; name=&quot;wam-new-line&quot; autofocus=&quot;autofocus&quot;
               class=&quot;wam-no-borders wam-shadow-border&quot; /&gt;
        &lt;button class=&quot;btn btn-success btn-sm pull-right&quot;&gt;&amp;plus;&lt;/button&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/li&gt;
&lt;/ul&gt;</pre>

            </div>

        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script>
        $(function () {

        });
    </script>
</body>
</html>
