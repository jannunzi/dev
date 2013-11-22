<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06.aspx.cs" Inherits="js_01" %>

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

        <!-- 06 -->
        <h1>Bind Events on Objects, Strings, Arrays, and Functions</h1>
        <button class="o"> Fire Object   </button>
        <button class="s"> Fire String   </button>
        <button class="a"> Fire Array    </button>
        <button class="f"> Fire Function </button>
        <script>
            // we can add event handling to objects, arrays, functions, and strings
            var colorObject = {};
            _.extend(colorObject, Backbone.Events);
            var colorArray = [];
            _.extend(colorArray, Backbone.Events);
            var colorFunction = function () {
                $("body").append("<h1>Color Function</h1>");
            }
            _.extend(colorFunction, Backbone.Events);
            var colorString = new String("orange");
            _.extend(colorString, Backbone.Events);
            // but not on literal strings or numbers
            // var colorString = "orange"; // does not work
            // bind event haldlers normally
            colorObject.on("obj", function () {
                $("h1").css("background-color", "red");
            });
            colorArray.on("arr", function () {
                $("h1").css("background-color", "blue");
            });
            colorFunction.on("fun", function () {
                $("h1").css("background-color", "yellow");
            });
            colorString.on("str", function () {
                $("h1").css("background-color", "orange");
            });
            // trigger normally
            $("button.o").click(function () {
                colorObject.trigger("obj");
            });
            $("button.a").click(function () {
                colorArray.trigger("arr");
            });
            $("button.f").click(function () {
                colorFunction.trigger("fun");
            });
            $("button.s").click(function () {
                colorString.trigger("str");
            });
        </script>

    </div>
</body>
</html>
