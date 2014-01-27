<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
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

        <h2>9000-9999</h2>
        <table>
            <thead>
                <tr>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    string nine = "&#9";
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
                            string entity = nine + zeros + count;
                            count++;
                    %>      <td><%= entity %> &amp;#9<%= zeros + count %></td>
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
    <script>
        $(function () {

        });
    </script>
</body>
</html>
