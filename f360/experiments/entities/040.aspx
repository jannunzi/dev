<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void registerBtn_Click(object sender, EventArgs e)
    {
        var username = usernameTbx.Text;
        var password1 = password1Tbx.Text;
        var password2 = password2Tbx.Text;
        USER user = UserDAO.lookup(username);
        if (user != null)
        {
            message.Text = "Username already exists";
        }
        else if( password1 == null || password2 == null ||
            password1 == "" || password2 == "")
        {
            message.Text = "Username and password can not be blank";
        }
        else if (password1 != password2)
        {
            message.Text = "Passwords don't match";
        }
        else if (password1 == password2)
        {
            UserDAO.create(username, password1);
            message.Text = "Registration successful";
        }
        else
        {
            message.Text = "Unable to register at this time";
        }

    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        var username = usernameTbx.Text;
        
        // @new
        var password = password1Tbx.Text;
        USER user = UserDAO.validate(username, password);
        
        if (user == null)
        {
            message.Text = "User Not Found";
        }
        else
        {
            message.Text = "User Found";
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

        <h1>Validate User</h1>

        <div class="row">
            <div class="col-sm-12">
                <h2>Login</h2>
                <asp:TextBox ID="usernameTbx" runat="server" CssClass="form-control" placeholder="username"/>
                <asp:TextBox ID="password1Tbx" runat="server" CssClass="form-control" placeholder="password" TextMode="Password"/>
                <asp:TextBox ID="password2Tbx" runat="server" CssClass="form-control" placeholder="password" TextMode="Password"/>
                <asp:Button ID="loginBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Login" OnClick="loginBtn_Click"/>
                <asp:Button ID="registerBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Register User" OnClick="registerBtn_Click"/>
                <asp:Label ID="message" runat="server" />

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
