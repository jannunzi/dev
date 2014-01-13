<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10-sayHelloCsharp.aspx.cs" Inherits="_10_sayHelloCsharp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="sayHello" runat="server" Text="Say Hello" OnClick="sayHello_Click" /><br/>
        <asp:TextBox ID="message" runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/10-sayHelloCsharp.aspx">10-sayHelloCsharp.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/10-sayHelloCsharp.aspx.cs.txt">10-sayHelloCsharp.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
