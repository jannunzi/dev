<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08-PageWithCodeFile.aspx.cs" Inherits="examples_asp_03_PageWithCodeFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Handling Events in Code Behind</title>
</head>
<body>
    <h1>Handling Events in Code Behind</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

        <h2>Source Code</h2>    
        <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/08-PageWithCodeFile.aspx">Page</a><br/>
        <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/08-PageWithCodeFile.aspx.cs">C#</a><br/>
    </div>
    </form>
</body>
</html>
