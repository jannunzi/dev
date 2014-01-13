<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06-HelloFromCS.aspx.cs" Inherits="examples_asp_HelloFromCSharp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Hello From C#</h1>
    <form id="form1" runat="server">
    <div>
        <h1>
        <%= hello %>
        </h1>
        <div>
            <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/06-HelloFromCS.aspx">Page</a><br/>
            <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/06-HelloFromCS.aspx.cs">C#</a><br/>
        </div>
    </div>
    </form>
</body>
</html>
