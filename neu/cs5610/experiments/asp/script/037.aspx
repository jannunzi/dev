<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server" method="get">
    <div class="container">

        <h1>My Parameters</h1>

        <div class="row">
            <div class="col-sm-4">

                <h3>Text Fields</h3>

                <input type="text"     name="wam-text"      class="form-control" placeholder="Text"/>
                <input type="email"    name="wam-email"     class="form-control" placeholder="Email"/>
                <input type="password" name="wam-password"  class="form-control" placeholder="Password"/>
                <input type="date"     name="wam-date"      class="form-control" value="2014-01-28"/>
                <input type="month"    name="wam-month"     class="form-control" value="2014-01"/>
                <input type="time"     name="wam-time"      class="form-control"/>
                <input type="week"     name="wam-week"      class="form-control"/>
                <input type="number"   name="wam-number"    class="form-control" value="1234"/>
                <input type="url"      name="wam-url"       class="form-control" value="http://css.com"/>
                <input type="range"    name="wam-range"     class="form-control" value="2" min="1" max="5"/>
                <input type="color"    name="wam-color"     class="form-control" value="#ff0000"/>

            </div>
            <div class="col-sm-4">

                <h3>Dropdown</h3>

                <select name="wam-option" class="form-control">
                    <option value="wam-value-1">Value 1</option>
                    <option value="wam-value-2">Value 2</option>
                    <option value="wam-value-3">Value 3</option>
                    <option value="wam-value-4">Value 4</option>
                </select>

                <h3>Radio Buttons</h3>

                <div class="row">
                    <div class="col-sm-6">
                        <h4>No Runat</h4>
                        <input type="radio" name="wam-gender-1" value="wam-male"/> Male
                        <br />
                        <input type="radio" name="wam-gender-1" value="wam-female"/> Female
                    </div>
                    <div class="col-sm-6">
                        <h4>Runat Server</h4>
                        <input type="radio" name="wam-gender-2" value="wam-male" runat="server"/> Male
                        <br />
                        <input type="radio" name="wam-gender-2" value="wam-female" runat="server"/> Female
                    </div>
                </div>

                <h3>Check Boxes</h3>

                <div class="row">
                    <div class="col-sm-6">
                        <h4>No Runat</h4>
                        <input type="checkbox" name="wam-macos-1" value="wam-macos-value"/> MacOS
                        <br />
                        <input type="checkbox" name="wam-windows-1" value="wam-windows-value"/> Windows
                        <br />
                        <input type="checkbox" name="wam-unix-1" value="wam-unix-value"/> Unix
                    </div>
                    <div class="col-sm-6">
                        <h4>Runat Server</h4>
                        <input type="checkbox" name="wam-macos-2" value="wam-macos-value" runat="server"/> MacOS
                        <br />
                        <input type="checkbox" name="wam-windows-2" value="wam-windows-value" runat="server"/> Windows
                        <br />
                        <input type="checkbox" name="wam-unix-2" value="wam-unix-value" runat="server"/> Unix
                    </div>
                </div>

                <h3>Buttons</h3>

                <button name="wam-yes" value="yes" class="btn btn-danger">Yes</button>
                <button name="wam-no" value="no" class="btn btn-success">No</button>
                <button name="wam-submit" value="submit button" class="btn btn-primary">Submit</button>

            </div>
            <div class="col-sm-4">

                <h2>Request Parameters</h2>

                <p> In this experiment we filter out all request parameters except
                    the ones we care about. We have pre-pended
                    <b class="wam-highlight">wam-</b> to all our parameters. The
                    <a href="#wam-script">ASP script</a> iterates over all the parameters,
                    but only displays the ones beginning with <b class="wam-highlight">wam</b>
                </p>

                <ul>
                <%
                foreach (object param in Request.Params)
                {
                  var parameterName
                        = param.ToString();
                  if (!parameterName.StartsWith("wam"))
                      continue;
                  var parameterValue
                        = Request.Params[parameterName];%>
                  <li><%= parameterName %>
                        = <%= parameterValue %></li>
                <%
                }%>
                </ul>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-sm-6">
                <a name="wam-script"></a>
                <h2>Displaying My Parameters</h2>
                <pre>
&lt;ul&gt;
&lt;%
foreach (object param in Request.Params)
{
    var parameterName = param.ToString();
    if (!parameterName.StartsWith(&quot;wam&quot;))
        continue;
    var parameterValue = Request.Params[parameterName];%&gt;
    &lt;li&gt;&lt;%= parameterName %&gt; = &lt;%= parameterValue %&gt;&lt;/li&gt;
&lt;%
}%&gt;
&lt;/ul&gt;</pre>
            </div>
            <div class="col-sm-6">

            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
