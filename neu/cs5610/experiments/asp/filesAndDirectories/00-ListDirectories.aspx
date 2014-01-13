<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00-ListDirectories.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h1>Directory Listing</h1>

        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/00-ListDirectories.aspx">Source</a><br/>

        <ul>
<%      string mappedPath = Server.MapPath("~\\");

		DirectoryInfo dirInfo = new DirectoryInfo(mappedPath);
        DirectoryInfo[] directories = dirInfo.GetDirectories();
        foreach (var directory in directories) {
%>          <li><%= directory.Name %></li>
<%      }
%>      </ul>
    </div>
    </form>
</body>
</html>
