<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        wam.Script script = new wam.Script();
        script.name = "AddAplusB";
        scriptName.Text = script.name;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="scriptName" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
