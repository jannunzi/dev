<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04-crud.aspx.cs" Inherits="_04_crud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id: <asp:TextBox ID="idTxt" runat="server"></asp:TextBox><br/>
        Name:   <asp:TextBox ID="nameTxt" runat="server"></asp:TextBox><br/>
        Label:  <asp:TextBox ID="labelTxt" runat="server"></asp:TextBox><br/>
        X:    <asp:TextBox ID="xTxt" runat="server"></asp:TextBox><br/>
        Y:   <asp:TextBox ID="yTxt" runat="server"></asp:TextBox><br/>
        Width:  <asp:TextBox ID="widthTxt" runat="server"></asp:TextBox><br/>
        Height: <asp:TextBox ID="heightTxt" runat="server"></asp:TextBox><br/>
        <asp:Button ID="insert" runat="server" Text="Insert" OnClick="insert_Click" />
        <asp:Button ID="selectById" runat="server" Text="Select By Id" OnClick="selectById_Click" />
        <asp:Button ID="selectAll" runat="server" Text="Select All" OnClick="selectAll_Click" />
        <asp:Button ID="update" runat="server" Text="Update" OnClick="update_Click" />
        <asp:Button ID="delete" runat="server" Text="Delete" OnClick="delete_Click" /><br />
        SQL: <asp:TextBox Width="500px" ID="sqlTxt" runat="server"></asp:TextBox>

        Result:<br/><asp:TextBox ID="resultTxt" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>    
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/04-crud.aspx">04-crud.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/04-crud.aspx.cs.txt">04-crud.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
