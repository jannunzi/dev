<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00-insert.aspx.cs" Inherits="_00_insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="vertex" runat="server">
    <div>
    <h2>Vertex</h2>
        Name:   <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox><br/>
        Label:  <asp:TextBox ID="labelTxt" runat="server"></asp:TextBox><br/>
        X:    <asp:TextBox ID="xTxt" runat="server"></asp:TextBox><br/>
        Y:   <asp:TextBox ID="yTxt" runat="server"></asp:TextBox><br/>
        Width:  <asp:TextBox ID="widthTxt" runat="server"></asp:TextBox><br/>
        Height: <asp:TextBox ID="heightTxt" runat="server"></asp:TextBox><br/>
        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" /><br />
        <asp:TextBox Width="500px" ID="sqlTxt" runat="server" Height="300px"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/00-insert.aspx">00-insert.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/00-insert.aspx.txt">00-insert.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
