<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11-sayMessageCsharp.aspx.cs" Inherits="_10_sayHelloCsharp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="messageTxt" runat="server"></asp:TextBox>
        <asp:Button ID="sayHelloMessage" runat="server" Text="Say Hello" OnClick="sayHello_Click" /><br/>
        <asp:TextBox ID="outputTxt" runat="server"></asp:TextBox>
    </div>
    
    <h2>Code</h2>
    <ul>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/11-sayMessageCsharp.aspx">11-sayMessageCsharp.aspx</a>
 		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/11-sayMessageCsharp.aspx.cs.txt">11-sayMessageCsharp.aspx.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/Vertex.cs.txt">Vertex.cs</a>
    		<li><a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/dao/App_Code/VertexDAO.cs.txt">VertexDAO.cs</a>
    </ul>
    </form>
</body>
</html>
