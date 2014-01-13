<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03-update.aspx.cs" Inherits="_03_update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id:       <asp:TextBox ID="idTxt"      runat="server"></asp:TextBox><br />
        New Name: <asp:TextBox ID="newNameTxt" runat="server"></asp:TextBox><br />
        <asp:Button ID="update"                runat="server" Text="Update" OnClick="update_Click" /><br />
        Result:   <br/><asp:TextBox ID="resultTxt"  runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/03-update.aspx">03-update.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/03-update.aspx.cs.txt">03-update.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
