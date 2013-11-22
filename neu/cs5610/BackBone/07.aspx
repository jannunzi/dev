<%@ Page Language="C#" AutoEventWireup="true" CodeFile="07.aspx.cs" Inherits="js_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="js/jquery-ui-1.10.3/themes/base/jquery-ui.css" />
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
    <script src="js/underscore.js"></script>
    <script src="js/backbone.js"></script>

</head>
<body>
    <div>

        <!-- 07 -->
        <button class="on">   Turn Event On  </button>
        <button class="off">  Turn Event Off </button>
        <button class="fire"> Fire Event     </button>
        <h1>Event Off</h1>
        <script>
            var toggleObject = {};
            _.extend(toggleObject, Backbone.Events);
            $("button.fire").click(function () {
                toggleObject.trigger("toggle");
            });
            $("button.on").click(function () {
                toggleObject.on("toggle", toggleH1);
            });
            $("button.off").click(function () {
                // 07
                toggleObject.off("toggle")
            });
            function toggleH1() {
                $("h1").toggle();
            }
        </script>

    </div>
</body>
</html>
