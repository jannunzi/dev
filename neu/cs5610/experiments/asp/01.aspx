<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="experiments_asp_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .highlight {
            font-weight: bold;
            color : red;
            text-decoration : underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2><%= hello %></h2>
        
        <p>
            This experiment demonstrates that variables declared in the code behind
            source file are available in the ASPX Web page.
        </p>

        <ol>
            <li>Add a new Web Form to your project as we did in the previous experiment</li>
            <li>Verify that a separate .cs file was created. This is the C# source code file related to the ASPX Web page</li>
            <li>Open the ASPX page and note the first line directive. For this Web form it is
                <pre>
&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot; <span class="highlight">CodeFile=&quot;01.aspx.cs&quot;</span> Inherits=&quot;experiments_asp_01&quot; %&gt;
                </pre>
            </li>
            <li>Note the CodeFile attribute set to 01.aspx.cs. It means that this Web form's C# code is the file 01.aspx.cs</li>
            <li>Open the C# file</li>
            <li>Add a protected string variable called hello with the string literal "Hello World from C#"</li>
            <li>Your code should look like
                <pre>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_asp_01 : System.Web.UI.Page
{
    <span class="highlight">protected String hello = "Hello World from C#";</span>
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
                </pre>
            </li>
            <li>In your ASPX Web page add an H2 tag that prints out the hello variable declared in the C# file
                <pre>
&lt;h2&gt;<span class="highlight">&lt;%= hello %&gt;</span>&lt;/h2&gt;
                </pre>
            </li>
            <li>When you run the page, <span class="highlight">&lt;%= hello %&gt;</span> is replaced by the
                literal string.
            </li>
        </ol>

        <h2>Source Code</h2>
        <ul>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/01.aspx">01.aspx</a></li>
            <li><a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/01.aspx.cs">01.aspx.cs</a></li>
        </ul>

    </div>
    </form>
</body>
</html>
