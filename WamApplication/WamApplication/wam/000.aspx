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

        <!-- login page -->
        <div class="wam-page-login wam-page">
            <h2>Login</h2>
            <input class="wam-username" />
            <input class="wam-password" type="password" />
            <a href="#" class="btn btn-primary wam-user-login-btn">Login</a>
        </div>

        <!-- profile page -->
        <div class="wam-page-profile wam-page">
            <h2>Profile</h2>

            <a href="#" class="btn btn-primary wam-applications-show-btn">Applications</a>
        </div>

        <!-- applications page -->
        <div class="wam-page-applications wam-page">
            <h2>Applications</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Controls</th>
                    </tr>
                </thead>
                <tbody class="wam-application-list-container">
                    <tr class="wam-application-list-item">
                        <td class="wam-application-name">Application 1</td>
                        <td>
                            <a href="#" class="wam-application-delete">Delete</a>
                            <a href="#" class="wam-application-edit">Edit</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="wam-page-application-details wam-page">
            <h2>Application Details</h2>
            <input class="wam-application-details-name form-control"/>
            <a href="#" class="wam-application-details-delete-btn">Delete</a>
            <a href="#" class="wam-application-details-save-btn">Save</a>
        </div>

        <div class="wam-page-application-new wam-page">
            <h2>New Application</h2>
            <input class="wam-application-new-name form-control"/>
            <a href="#" class="wam-application-new-save-btn">Save</a>
        </div>

        <div class="wam-toolbar wam-bottom-stick wam-show-on-hover">
            <h2>Toolbar</h2>
            <select>
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
