<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "Hello From Page Code";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPX Labels, Buttons, and Button Event Handlers</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>ASPX Labels, Buttons, and Button Event Handlers</h1>

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

        <p>
            ASPX declares many useful components that extend the features of
            native HTML tags. These components are rendered on the server and
            sent to the browser as plain HTML tags. For instance the asp:Label
            component is eventually rendered as an HTML span tag and the
            asp:Button component is eventually rendered as an input of type
            Button.
        </p>

        <h2>Button Event Handlers</h2>

        <p>
            Buttons can be linked to code that executes when the button is clicked.
            To link the button to executable code, give the button a unique ID, e.g.,
            Button1 and then declare a function whose name is the button name
            followed by _Click, e.g., the button's ID above is "Button1". If
            clicked function Button1_Click will be invoked. Here is the button
            declaration:
        </p>

        <pre>
    &lt;asp:Button ID=&quot;Button1&quot; runat=&quot;server&quot; OnClick=&quot;Button1_Click&quot; Text=&quot;Button&quot; /&gt;
        </pre>

        <p>
            And here is the function implementation. It is referring to Label1
            declared in the Web page and then changing its Text property to
            some literal value, i.e., "Hello From Page Code"
        </p>

        <pre>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "Hello From Page Code";
    }
        </pre>

        <h2>Source Code</h2>

        <a target="_blank" href="../../../fileview/Default.aspx?~/experiments/asp/helloWorld/07-PageWithCode.aspx">Page</a><br/>

    </div>
    </form>
</body>
</html>
