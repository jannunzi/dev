<%@ Page Language="C#" AutoEventWireup="true" CodeFile="00-RequestParameters.aspx.cs" Inherits="examples_asp_requestParameters_00_RequestParameters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Request Parameters</h1>
    <form id="form1" runat="server" action="00-RequestParameters.aspx" method="get">
    <div>
    <%
        string name = Request.QueryString["name"];
    %>  Hello <%= name %><br/>
        Name: <input name="name" />
        <button>Submit</button>
    </div>
    </form>
    <div>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/requestParameters/00-RequestParameters.aspx">Page</a><br/>
    </div>
</body>
</html>
