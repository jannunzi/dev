<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03-ListDirectoryAsParameter.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>List Directory ad Parameter</h1>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/03-ListDirectoryAsParameter.aspx">Source</a><br/>
    <form id="form1" runat="server">
    <div>
        <ul>
<%		string basePath = Server.MapPath("~\\wam\\");
        string paramPath = Request.QueryString["path"];
        if (paramPath == null)
            paramPath = "";
        string path = basePath + paramPath;
        DirectoryInfo directory = new DirectoryInfo(path);
        FileInfo[] files = directory.GetFiles();
        DirectoryInfo[] directories = directory.GetDirectories();
        foreach (var dir in directories) {
%>          <li><%= dir.Name %></li>
<%      }
        foreach (var file in files) {
%>          <li><%= file.Name %></li>
<%      }
%>      </ul>
    </div>
    </form>
</body>
</html>
