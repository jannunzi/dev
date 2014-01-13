<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="experiments_asp_bootstrap_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>Basic Form</h1>
        <div class="row">
            <div class="col-md-12">
                <form id="form1" runat="server" role="form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox type="email" CssClass="form-control" placeholder="Enter email" ID="exampleInputEmail1" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <asp:TextBox type="password" CssClass="form-control" placeholder="Password" ID="exampleInputPassword1" runat="server"></asp:TextBox>
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
