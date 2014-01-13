<%@ Page Language="C#" AutoEventWireup="true" CodeFile="12-TestEnvironment.aspx.cs" Inherits="examples_asp_07_TestEnvironment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Test Environment</h1>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">
            <asp:TextBox ID="output" runat="server" Height="140px" TextMode="MultiLine" Width="233px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button  ID="run"    runat="server" Text="Run"   OnClick="run_Click" />
            <asp:Button  ID="clear"  runat="server" Text="Clear" OnClick="clear_Click" />
        </asp:Panel>

    </div>
    </form>
        <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/12-TestEnvironment.aspx">Page</a><br/>
        <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/12-TestEnvironment.aspx.cs">C#</a><br/>
</body>
</html>
