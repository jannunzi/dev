<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <style>
        td {
            padding-right : 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Entities</h1>

        <h2>8000-8999</h2>
        <table>
            <thead>
                <tr>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    string eight = "&#8";
                    int count = 0;
                    string zeros = "";
                    for (int row = 0; row < 100; row++)
                    {
                %>      <tr>
                <%      for (int col = 0; col < 10; col++)
                        {
                            zeros = "";
                            if (count < 100)
                            {
                                zeros = "0";
                            }
                            if (count < 10)
                            {
                                zeros = "00";
                            }
                            string entity = eight + zeros + count;
                            count++;
                    %>      <td><%= entity %> &amp;#8<%= zeros + count %></td>
                    <%
                        }
                %>      </tr>
                <%
                    }
                     %>
            </tbody>
        </table>

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
</body>
</html>
