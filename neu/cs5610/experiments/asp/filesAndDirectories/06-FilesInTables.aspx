<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06-FilesInTables.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Files in Tables</h1>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/06-FilesInTables.aspx">Source</a><br/>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/06-FilesInTables.aspx.cs">C#</a><br/>
    <form id="form1" runat="server">
    <div>
        <!-- new { -->
        <table>
            <tr><th>Name</th></tr>
        <!-- } new -->
<%      
%>
        <!-- new { -->
            <tr><td><a href="<%= "06-FilesInTables.aspx?path="+paramPath+"\\.." %>">..</a></td></tr>
        <!-- } new -->
<%      if(directories != null)
        foreach (var dir in directories) {
%>
        <!-- new { -->
            <tr><td><a href="<%= "06-FilesInTables.aspx?path="+paramPath+"\\"+dir.Name %>"><%= dir.Name %>/</a></td></tr>
        <!-- } new -->
<%      }
        if(files != null)
        foreach (var file in files) {
%>
        <!-- new { -->
            <tr><td><%= file.Name %></td></tr>
        <!-- } new -->
<%      }
%>
        <!-- new { -->
        </table>
        <!-- } new -->
    </div>
    </form>
</body>
</html>
