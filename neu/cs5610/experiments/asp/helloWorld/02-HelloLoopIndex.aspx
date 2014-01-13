<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02-HelloLoopIndex.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Hello Loop Index</title>
</head>
<body>
    <h1>Hello Loop Index</h1>
<ul>
<%	for(int i=0; i<10; i++) {
%>	<li>Hello World <%= i %></li>
<%	}
%>
</ul>

    <p>
        Variables can be embedded in source code using the &lt;%= %&gt; notation.
        For instance, the numbers 0 through 10 in the above unordered list were
        displayed using &lt;%= i %&gt;. The variable i is set by a surrounding loop
        as shown below.
    </p>

    <pre>
&lt;ul&gt;
&lt;%	for(int i=0; i&lt;10; i++) {
%&gt;	&lt;li&gt;Hello World &lt;%= i %&gt;&lt;/li&gt;
&lt;%	}
%&gt;
&lt;/ul&gt;
    </pre>

    <h2>Source Code</h2>
    <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/02-HelloLoopIndex.aspx">Source</a><br/>

</body>
</html>
