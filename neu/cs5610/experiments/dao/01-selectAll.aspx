<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01-selectAll.aspx.cs" Inherits="_01_select" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="select" runat="server" Text="Select" OnClick="select_Click" /><br />
        Result: 
        <br />
        <asp:TextBox ID="resultTxt" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/01-selectAll.aspx">01-selectAll.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/01-selectAll.aspx.cs.txt">01-selectAll.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
