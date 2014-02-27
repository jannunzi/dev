<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js""></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <script>
            $(function () {
                var data = {
                    login: {
                        username: "username",
                        password: "password"
                    }
                };
                $.ajax({
                    url: "http://localhost:50341/UserWebService.asmx/ValidateLogin",
                    data : JSON.stringify(data),
                    contentType: "application/json; charset=utf-8;",
                    type: "post",
                    success: function (response) {
                        console.log(response);
                    }
                })
            })
        </script>
        

    </div>
    </form>
</body>
</html>
