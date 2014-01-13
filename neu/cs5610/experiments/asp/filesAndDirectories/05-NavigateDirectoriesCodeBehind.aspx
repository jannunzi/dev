<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05-NavigateDirectoriesCodeBehind.aspx.cs" Inherits="examples_asp_08_ReadDirectories" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Navigate Directories with Code Behind</h1>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/05-NavigateDirectoriesCodeBehind.aspx">Source</a><br/>
            <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/filesAndDirectories/05-NavigateDirectoriesCodeBehind.aspx.cs">C#</a><br/>

    <form id="form1" runat="server">
    <div>
        <ul>
<%      
%>          <li><a href="<%= "05-NavigateDirectoriesCodeBehind.aspx?path="+paramPath+"\\.." %>">..</a></li>
<%      if(directories != null)
        foreach (var dir in directories) {
%>          <li><a href="<%= "05-NavigateDirectoriesCodeBehind.aspx?path="+paramPath+"\\"+dir.Name %>"><%= dir.Name %>/</a></li>
<%      }
        if(files != null)
        foreach (var file in files) {
%>          <li><%= file.Name %></li>
<%      }
%>      </ul>
    </div>
    </form>
</body>
</html>
