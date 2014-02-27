<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Template</h1>

        <a href="#" id="create">Create</a><br />

        <rasala:FileView ID="fileView" runat="server" />
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script>
        $(function () {
            $("#create").click(create);
        });
        function create() {
            $.ajax({
                url: "http://localhost:62600/TestService.asmx/CreateBox",
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                }
            });
        }
        function sayHello() {
            $.ajax({
                url: "http://localhost:62600/TestService.asmx/HelloWorld",
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    console.log(response);
                }
            });
        }
    </script>
</body>
</html>
