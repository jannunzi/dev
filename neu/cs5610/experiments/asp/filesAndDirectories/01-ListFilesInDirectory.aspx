<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01-ListFilesInDirectory.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <h1>List Files in a Directory</h1>

    <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/01-ListFilesInDirectory.aspx">Source</a><br/>

    <div>
        <ul>
<%      string mappedPath = Server.MapPath("~\\experiments\\");
        DirectoryInfo directory = new DirectoryInfo(mappedPath);
        FileInfo[] files = directory.GetFiles();
        foreach (var file in files) {
%>          <li><%= file.Name %></li>
<%      }
%>      </ul>
    </div>
    </form>
</body>
</html>
