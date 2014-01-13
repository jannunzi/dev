<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02-CreateDirectory.aspx.cs" Inherits="examples_asp_10_CreateDirectory" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h1>Create a Directory</h1>

        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/02-CreateDirectory.aspx">Source</a><br/>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/02-CreateDirectory.aspx.cs">C#</a><br/>

        <asp:TextBox ID="name" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Create Directory" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
