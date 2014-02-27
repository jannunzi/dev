<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void addBtn_Click(object sender, EventArgs e)
    {
        var username = usernameTbx.Text;
        var password = passwordTbx.Text;

        // @new insert new user into database
        using (var db = new F360Entities())
        {
            USER user = new USER();
            user.username = username;
            user.password = password;
            db.USERS.Add(user);
            db.SaveChanges();
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

        <h1>Insert New User</h1>

        <div class="row">
            <div class="col-sm-8">
                <h2>User</h2>
                <asp:TextBox ID="usernameTbx" runat="server" CssClass="form-control" placeholder="username"/>
                <asp:TextBox ID="passwordTbx" runat="server" CssClass="form-control" placeholder="password" TextMode="Password"/>
                <asp:Button ID="addBtn" runat="server" CssClass="btn btn-primary btn-block" Text="Add User" OnClick="addBtn_Click"/>
            </div>
        </div>

    </div>
    </form>
</body>
</html>
