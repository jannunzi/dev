<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01-HelloLoop.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Hello Loop</title>
</head>
<body>
    <h1>Hello Loop</h1>

    <ol>
    <%	for(int i=0; i<10; i++) {
    %>	    <li>Hello World</li>
    <%	}
    %>
    </ol>

    <p>
        You can generate dynamic content by embedding source code right in your Web pages.
        For instance the ordered list above was created using the following for loop.
    </p>

    <pre>
    &lt;%	for(int i=0; i&lt;10; i++) {
    %&gt;	    &lt;li&gt;Hello World&lt;/li&gt;
    &lt;%	}
    %&gt;
    </pre>

    <h2>Source Code</h2>
    <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/01-HelloLoop.aspx">Source</a><br/>
</body>
</html>
