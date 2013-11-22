<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03.aspx.cs" Inherits="js_01" %>

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

        <!-- 03 -->
        <h1>Event Namespaces</h1>
        <button class="bg red">   Red Background   </button>
        <button class="bg blue">  Blue Background  </button>
        <button class="bg yellow">Yellow Background</button>
        <button class="fg red">   Red Foreground   </button>
        <button class="fg blue">  Blue Foreground  </button>
        <button class="fg yellow">Yellow Foreground</button>
        <script>
            var colorObject = {};
            _.extend(colorObject, Backbone.Events);
            // namespace events with colons
            colorObject.on("bg:red", function () {
                $("h1").css("background-color", "red");
            });
            colorObject.on("bg:blue", function () {
                $("h1").css("background-color", "blue");
            });
            colorObject.on("bg:yellow", function () {
                $("h1").css("background-color", "yellow");
            });
            colorObject.on("fg:red", function () {
                $("h1").css("color", "red");
            });
            colorObject.on("fg:blue", function () {
                $("h1").css("color", "blue");
            });
            colorObject.on("fg:yellow", function () {
                $("h1").css("color", "yellow");
            });
            $("button.bg.red"   ).click(function () { colorObject.trigger("bg:red"   );});
            $("button.bg.blue"  ).click(function () { colorObject.trigger("bg:blue"  );});
            $("button.bg.yellow").click(function () { colorObject.trigger("bg:yellow");});
            $("button.fg.red"   ).click(function () { colorObject.trigger("fg:red"   );});
            $("button.fg.blue"  ).click(function () { colorObject.trigger("fg:blue"  );});
            $("button.fg.yellow").click(function () { colorObject.trigger("fg:yellow");});
        </script>

    </div>
</body>
</html>
