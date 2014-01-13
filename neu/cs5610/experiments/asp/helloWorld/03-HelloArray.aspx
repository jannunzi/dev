<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03-HelloArray.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Hello Array</title>
</head>
<body>
    <h1>Hello Array</h1>

    <p>
        We can declare arrays in pages and then iterate over them
    </p>

<ol>
<%
    string[] names = { "Name 1", "Name 2", "Name 3" };
    for (int i = 0; i < names.Length; i++)
    {
%>	<li>Hello World <%= names[ i ] %></li>
<%	}
%>
</ol>

    <h2>Source Code</h2>
    <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/03-HelloArray.aspx">Source</a><br/>
</body>
</html>
