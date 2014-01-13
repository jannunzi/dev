<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03-HelloArray.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>00</title>
</head>
<body>
    <h1>Hello Array</h1>
<ol>
<%
    string[] names = { "Name 1", "Name 2", "Name 3" };
    for (int i = 0; i < names.Length; i++)
    {
%>	<li>Hello World <%= names[ i ] %></li>
<%	}
%>
</ol>
    <div>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/helloWorld/03-HelloArray.aspx">Source</a><br/>
    </div>
</body>
</html>
