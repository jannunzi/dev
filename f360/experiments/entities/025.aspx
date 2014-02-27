<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void addBtn_Click(object sender, EventArgs e)
    {
        var username = usernameTbx.Text;
        var password = passwordTbx.Text;
        using (var db = new F360Entities())
        {
            USER user = new USER();
            user.username = username;
            user.password = password;
            db.USERS.Add(user);
            db.SaveChanges();
        }
    }

    // @new
    protected void lookupBtn_Click(object sender, EventArgs e)
    {
        var username = usernameTbx.Text;
        var password = passwordTbx.Text;
        using (var db = new F360Entities())
        {
            var user = (from u in db.USERS
                        where u.username == username
                        select u).FirstOrDefault();
            if (user == null)
            {
                userFound.Text = "User Not Found";
            }
            else
            {
                userFound.Text = "User Found";
            }
        }
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.10.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Lookup Up User</h1>

        <div class="row">
            <div class="col-sm-8">
                <h2>User</h2>
                <asp:TextBox ID="usernameTbx" runat="server" CssClass="form-control" placeholder="username"/>
                <asp:TextBox ID="passwordTbx" runat="server" CssClass="form-control" placeholder="password" TextMode="Password"/>
                <asp:Button ID="addBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Add User" OnClick="addBtn_Click"/>

                <!-- @new -->
                <asp:Button ID="lookupBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Lookup User" OnClick="lookupBtn_Click"/>
                <asp:Label ID="userFound" runat="server" />

                <h2>Users</h2>
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:F360ConnectionString1 %>" DeleteCommand="DELETE FROM [USERS] WHERE [Id] = @Id" InsertCommand="INSERT INTO [USERS] ([username], [password]) VALUES (@username, @password)" ProviderName="<%$ ConnectionStrings:F360ConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [username], [password] FROM [USERS]" UpdateCommand="UPDATE [USERS] SET [username] = @username, [password] = @password WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    </div>
    </form>
</body>
</html>
