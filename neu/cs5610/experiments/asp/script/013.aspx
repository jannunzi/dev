<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <style>
        td {
            padding : 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>HTML Entity Explorer</h1>

        <% string queryParam = Request.Params["entity"];
           int integerValue = 0;
           bool isInteger = int.TryParse(queryParam, out integerValue);
           if (queryParam == null || queryParam == "" || !isInteger)
           {
               %>
                Please provide an INTEGER query parameter in the form:
        <pre>
?entity=INTEGER</pre>
        For example:
        <pre>
?entity=9</pre>
        <%
               return;
           }
        %>

        <h2>Entities from &amp;#<%=queryParam %>000; to &amp;#<%=queryParam %>999;</h2>
        <table>
            <thead>
                <tr>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    string ampHash = "&#";
                    string thousand = ampHash + queryParam;
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
                            string entity = thousand + zeros + count + ";";
                    %>      <td><%= entity %><br/>&amp;&#35;<%= queryParam %><%= zeros + count %>;</td>
                    <%
                            count++;
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
