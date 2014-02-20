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

    

    <!-- Changed method to get so we can see the form elements being submitted -->
    <form id="form1" runat="server" method="get">
    <div class="container">

        <h1>Update form when stopped dragging and submit form</h1>

        <!-- The names of the query parameters are taken from these IDs,
             but we are grabbing the elements from jquery using the CSS
             classes instead. We are going to hide these since we don't
             want users actually typing into these.
             -->
        <asp:TextBox ID="boxtop"  runat="server" CssClass="boxtop"/>
        <asp:TextBox ID="boxleft" runat="server" CssClass="boxleft"/>
        <button type="submit" class="boxsave">save</button>
        <div class="box">
            Drag me
        </div>
    
        <rasala:FileView ID="fileView" runat="server" />

    </div>
    </form>

    <script>
        $(function () {
            // When the user stops dragging, the form will be updated
            // from the widget's current position and then the form
            // will submit
            $(".box").draggable({
                stop: function (event, ui) {
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
