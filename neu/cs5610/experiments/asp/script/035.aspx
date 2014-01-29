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

        <h1>Form Parameters</h1>

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

                <input type="radio" name="wam-gender" value="wam-male"/> Male
                <br />
                <input type="radio" name="wam-gender" value="wam-female"/> Female
                <br />

                <h3>Check Boxes</h3>

                <input type="checkbox" name="wam-macos" value="wam-male-value"/> MacOS
                <br />
                <input type="checkbox" name="wam-windows" value="wam-female-value"/> Windows
                <br />
                <input type="checkbox" name="wam-unix" value="wam-female-value"/> Unix
                <br />

                <h3>Buttons</h3>

                <button name="wam-yes" value="yes" class="btn btn-danger">Yes</button>
                <button name="wam-no" value="no" class="btn btn-success">No</button>
                <button name="wam-submit" value="submit button" class="btn btn-primary">Submit</button>

            </div>
        </div>

        <h2>Request Parameters</h2>
        <ul>
        <%  foreach (object param in Request.Params)
            {
                var parameterName  = param.ToString();
                var parameterValue = Request.Params[parameterName];%>
                <li><%= parameterName %> = <%= parameterValue %></li>
        <%  } %>
        </ul>


        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
