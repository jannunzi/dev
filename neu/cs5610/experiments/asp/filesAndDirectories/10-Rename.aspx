<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10-Rename.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
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
    <h1>Rename Files and Directories</h1>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/10-Rename.aspx">Source</a><br/>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/10-Rename.aspx.cs">C#</a><br/>
    <!-- new { -->
    <form id="form1" runat="server" method="get" action="10-Rename.aspx">
    <!-- } new -->
    <div>
        <table>
            <tr>
                <th>Name</th>
                <th>Created</th>
                <th>Accessed</th>
                <th>Modified</th>
                <th>Action</th>
            </tr>
            <!-- new { -->
            <tr>
                <td colspan="5">
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <!-- } new -->
<%      string thisFile = "10-Rename.aspx";
        if(!paramPath.Equals("\\..")) {
%>          <tr><td colspan="5"><a href="<%= thisFile + "?path="+paramPath+"\\.." %>">../</a></td></tr>
<%      }
        if(directories != null)
        foreach (var dir in directories) {
%>          <tr>
                <td><a href="<%= thisFile + "?path="+paramPath+"\\"+dir.Name %>"><%= dir.Name %>/</a></td>
                <td><%= dir.CreationTime %></td>
                <td><%= dir.LastAccessTime %></td>
                <td><%= dir.LastWriteTime %></td>
                <td><a href="<%= thisFile %>?path=<%= paramPath %>&delete=<%= dir.Name+"/" %>">Delete</a>
                <!-- new { -->
                <button name="rename" value="<%= dir.Name+"/" %>">Rename</button></td>
                <!-- } new -->
            </tr>
<%      }
        if(files != null)
        foreach (var file in files) {
%>          <tr>
                <td><a href="<%= "\\wam\\" + paramPath + "\\" + file.Name %>"><%= file.Name %></a></td>
                <td><%= file.CreationTime %></td>
                <td><%= file.LastAccessTime %></td>
                <td><%= file.LastWriteTime %></td>
                <td><a href="<%= thisFile %>?path=<%= paramPath %>&delete=<%= file.Name %>">Delete</a>
                <!-- new { -->
                <button name="rename" value="<%= file.Name %>">Rename</button></td>
                <!-- } new -->
            </tr>
<%      }
%>      </table>
        <!-- new { -->
        <input type="hidden" name="path" value="<%= paramPath %>"/>
        <!-- } new -->
    </div>
    </form>
</body>
</html>
