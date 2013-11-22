<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05.aspx.cs" Inherits="js_01" %>

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

        <!-- 05 -->
        <h1>Listening to All Events</h1>
        <button class="color yellow red"> Yellow on Red </button>
        <button class="color blue red">   Blue on Red   </button>
        <button class="color yellow blue">Yellow on Blue</button>

        <script>
            var colorObject = {};
            _.extend(colorObject, Backbone.Events);
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

            // 05 any event sent to colorObject will trigger the all event
            colorObject.on("all", function (eventName) {
                $("body").append("<h2>All Event Received "+eventName+"</h2>");
            });

            $("button.color.yellow.red").click(function () {
                colorObject.trigger("fg:yellow bg:red");
            });
            $("button.color.blue.red").click(function () {
                colorObject.trigger("fg:blue bg:red");
            });
            $("button.color.yellow.blue").click(function () {
                colorObject.trigger("fg:yellow bg:blue");
            });
        </script>

    </div>
</body>
</html>
