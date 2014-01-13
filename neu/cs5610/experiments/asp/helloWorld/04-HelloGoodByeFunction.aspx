<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04-HelloGoodByeFunction.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>00</title>
</head>
<body>
    <h1>Hello Goodbye Function</h1>
<ol>
<%
    string[] names = {"Name 1", "Name 2", "Name 3" };
    for(int i=0; i<names.Length; i++) {
		String message = sayGoodbye(names [ i ]);
%>	<li><%= message %></li>
<%	}
%>
</ol>
    <div>
        <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/asp/helloWorld/04-HelloGoodByeFunction.aspx">Source</a><br/>
    </div>
</body>
</html>

<script runat="server">
    string sayGoodbye(string name)
    {
        return "Goodbye " + name;
    }
</script>
