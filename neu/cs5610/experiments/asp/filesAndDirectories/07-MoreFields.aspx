<%@ Page Language="C#" AutoEventWireup="true" CodeFile="07-MoreFields.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        tr:nth-child(even)
        {
            background-color : beige;
        }
        tr:nth-child(odd)
        {
            background-color: lightblue;
        }
        th
        {
            background-color: black;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Showing more Fields</h1>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/07-MoreFields.aspx">Source</a><br/>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/07-MoreFields.aspx.cs">C#</a><br/>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <th>Name</th>
                <!-- new { -->
                <th>Created</th>
                <th>Accessed</th>
                <th>Modified</th>
                <!-- } new -->
            </tr>
<%      if(!paramPath.Equals("\\..")) {
%>          <tr><td colspan="4"><a href="<%= "07-MoreFields.aspx?path="+paramPath+"\\.." %>">../</a></td></tr>
<%      }
        if(directories != null)
        foreach (var dir in directories) {
%>          <tr>
                <td><a href="<%= "07-MoreFields.aspx?path="+paramPath+"\\"+dir.Name %>"><%= dir.Name %>/</a></td>
                <!-- new { -->
                <td><%= dir.CreationTime %></td>
                <td><%= dir.LastAccessTime %></td>
                <td><%= dir.LastWriteTime %></td>
                <!-- } new -->
            </tr>
<%      }
        if(files != null)
        foreach (var file in files) {
%>          <tr>
                <td><%= file.Name %></td>
                <!-- new { -->
                <td><%= file.CreationTime %></td>
                <td><%= file.LastAccessTime %></td>
                <td><%= file.LastWriteTime %></td>
                <!-- } new -->
            </tr>
<%      }
%>      </table>
    </div>
    </form>
</body>
</html>
