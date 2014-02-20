<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.css" />
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.js"></script>
    <style>

        /* @new hide the form controls */
        .wam-hidden {
            display : none;
        }

        .box {
            width : 100px;
            height : 100px;
            position : absolute;
            top:100px;
            left:100px;
            background-color:yellow;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" method="get">
    <div class="container">

        <h1>Hide form controls, add ID</h1>

        <!-- @new hide the form controls -->
        <div class="wam-hidden">
            <asp:TextBox ID="boxtop"  runat="server" CssClass="boxtop"/>
            <asp:TextBox ID="boxleft" runat="server" CssClass="boxleft"/>
            <button type="submit" class="boxsave">save</button>

            <!-- @new added id field -->
            <asp:TextBox ID="id"  runat="server" CssClass="boxid"/>

        </div>

        <div class="box" id="123">
            Drag me
        </div>
    
        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>

    <script>
        $(function () {
            $(".box").draggable({
                stop: function (event, ui) {

                    // @new
                    var id = ui.helper.attr("id");
                    $(".boxid").val(id);

                    var position = ui.position;
                    $(".boxtop").val(position.top);
                    $(".boxleft").val(position.left);
                    $(".boxsave").click();
                }
            });
        });
    </script>
</body>
</html>
