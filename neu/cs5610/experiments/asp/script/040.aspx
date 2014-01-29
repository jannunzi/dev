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
        ul.wam-script li {
            padding-bottom : 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Script Editor</h1>

        <div class="row">
            <div class="col-md-4">

           <ul class="wam-no-bullets wam-script">
        <% int counter = 0;
           foreach(object param in Request.Params) {
               if (param.ToString().StartsWith("wam")) {
                   string value = Request.Params[param.ToString()];
        %>         <li>
                   <input
                       class="wam-width-200 wam-shadow-border wam-no-borders wam-margin-10"
                       type="text" name="wam-<%= counter %>" value="<%= value %>"/></li>
        <%         counter++;
               }
           }
        %>     <li><input type="text" id="0" name="wam-new-line" autofocus="autofocus" class="wam-width-200 wam-no-borders wam-margin-10 wam-shadow-border" /><button class="btn btn-success btn-sm">&plus;</button></li>
           </ul>

            </div>
            <div class="col-md-8">

                <pre>
&lt;ul class=&quot;wam-no-bullets wam-script&quot;&gt;
&lt;%
int counter = 0;
foreach(object param in Request.Params) {
   if (param.ToString().StartsWith(&quot;wam&quot;)) {
      string value = Request.Params[param.ToString()];
%&gt;
      &lt;li&gt;
         &lt;input
           class=&quot;wam-width-200 wam-shadow-border wam-no-borders wam-margin-10&quot;
           type=&quot;text&quot;
           name=&quot;wam-&lt;%= counter %&gt;&quot;
           value=&quot;&lt;%= value %&gt;&quot;/&gt;
      &lt;/li&gt;
&lt;%
      counter++;
   }
}
%&gt;
      &lt;li&gt;
         &lt;input
            type=&quot;text&quot;
            id=&quot;0&quot;
            name=&quot;wam-new-line&quot;
            autofocus=&quot;autofocus&quot;
            class=&quot;wam-width-200 wam-no-borders wam-margin-10 wam-shadow-border&quot; /&gt;
         &lt;button class=&quot;btn btn-success btn-sm&quot;&gt;&amp;plus;&lt;/button&gt;
      &lt;/li&gt;
&lt;/ul&gt;</pre>

            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
