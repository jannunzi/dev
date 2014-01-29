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

        <h1>All Request Parameters</h1>

        <div class="row">
            <div class="col-sm-6">
                <ul>
                <%
                foreach (object param in Request.Params)
                {
                  var parameterName  = param.ToString();
                  var parameterValue = Request.Params[parameterName];
                %><li><%= parameterName %> = <%= parameterValue %></li>
                <%
                }
                %>
                </ul>
            </div>
            <div class="col-sm-6">
                <pre>
&lt;ul&gt;
&lt;%
foreach (object param in Request.Params)
{
  var parameterName
        = param.ToString();
  var parameterValue
        = Request.Params[parameterName];%&gt;
  &lt;li&gt;&lt;%= parameterName %&gt;
        = &lt;%= parameterValue %&gt;&lt;/li&gt;
&lt;%
}
%&gt;
&lt;/ul&gt;</pre>
            </div>
        </div>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
