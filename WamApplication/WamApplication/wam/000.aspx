<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="000.aspx.cs" Inherits="WamApplication.wam._000" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Content/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Content/wam.css" />
    <script src="../Scripts/jquery-1.10.2.js"></script>
    <script src="../Scripts/wam.js"></script>
    <script src="../Scripts/wam-user.js"></script>
    <script src="../Scripts/wam-application.js"></script>
    <script>
        $(function () {
            wam.init();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container wam">
        <div class="wam-login wam-section">
            <input id="wam-username" />
            <input id="wam-password" type="password" />
            <a href="#" id="wam-login-action" class="btn btn-primary">Login</a>
        </div>
        <div class="wam-profile wam-section">
            <table class="table wam-application wam-list">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Controls</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Application 1</td>
                        <td>
                            <a href="#" class="wam-delete">Delete</a>
                            <a href="#" class="wam-edit">Edit</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="wam-page wam-list wam-section">

        </div>
        <div class="wam-page wam-editor wam-section">
            <div class="wam-region wam-wrapper">
                <div class="wam-content">

                </div>
            </div>
        </div>
        <div class="wam-toolbar wam-bottom-stick wam-show-on-hover">
            <select class="wam-asset-type">
                <option value="wam-application">Application</option>
                <option value="wam-age">Page</option>
                <option value="wam-region">Region</option>
            </select>
            <input class="wam-input" />
            <a href="#" class="wam-add">Add</a>
            <a href="#" class="wam-delete">Delete</a>
        </div>
    </div>
    </form>
</body>
</html>
