<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02-delete.aspx.cs" Inherits="_02_delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id:     <asp:TextBox ID="idTxt"     runat="server"></asp:TextBox>
        <asp:Button ID="delete" runat="server" Text="Delete" OnClick="delete_Click" /><br />
        Result: <br/><asp:TextBox ID="resultTxt" runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/02-delete.aspx">02-delete.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/02-delete.aspx.cs.txt">02-delete.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
