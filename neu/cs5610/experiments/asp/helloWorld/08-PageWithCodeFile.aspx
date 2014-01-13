<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08-PageWithCodeFile.aspx.cs" Inherits="examples_asp_03_PageWithCodeFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Page with Code Behind</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
    </div>
    </form>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/helloWorld/08-PageWithCodeFile.aspx">Page</a><br/>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/helloWorld/08-PageWithCodeFile.aspx.cs">C#</a><br/>
</body>
</html>
