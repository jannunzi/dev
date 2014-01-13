<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01-selectOne.aspx.cs" Inherits="_01_selectOne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Id: <asp:TextBox ID="idTxt" runat="server"></asp:TextBox>
        <asp:Button ID="select" runat="server" Text="Select" OnClick="select_Click" /><br />
        Result: <asp:TextBox ID="resultTxt" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/01-selectOne.aspx">01-selectOne.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/01-selectOne.aspx.cs.txt">01-selectOne.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
