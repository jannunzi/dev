<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04-NavigateDirectories.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Navigate Directories</h1>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/04-NavigateDirectories.aspx">Source</a><br/>
    <form id="form1" runat="server">
    <div>
        <ul>
<%      string basePath = "~\\wam\\";
        string paramPath = Request.QueryString["path"];
        if (paramPath == null)
            paramPath = "";
        string path = basePath + paramPath;
        string mappedPath = Server.MapPath(path);
        DirectoryInfo directory = new DirectoryInfo(mappedPath);
        FileInfo[] files = directory.GetFiles();
        DirectoryInfo[] directories = directory.GetDirectories();
%>          <li><a href="<%= "04-NavigateDirectories.aspx?path="+paramPath+"\\.." %>">..</a></li>
<%      foreach (var dir in directories) {
%>          <li><a href="<%= "04-NavigateDirectories.aspx?path="+paramPath+"\\"+dir.Name %>"><%= dir.Name %>/</a></li>
<%      }
        foreach (var file in files) {
%>          <li><%= file.Name %></li>
<%      }
%>      </ul>
    </div>
    </form>
</body>
</html>
