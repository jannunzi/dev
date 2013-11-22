<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02.aspx.cs" Inherits="js_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- 01 -->
    <link rel="stylesheet" href="js/jquery-ui-1.10.3/themes/base/jquery-ui.css" />
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
    <script src="js/underscore.js"></script>
    <script src="js/backbone.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <!-- 02 -->
        <h1>Add Event Handling to Any Object</h1>
        <script>
            // we can make any object event aware by extending it with Backbone.Events
            var someObject = {};
            _.extend(someObject, Backbone.Events);
            // we can then bind events to the object
            // and associate a function that executes
            // when the event is triggered on the object
            someObject.on("someEvent", function (someParameter) {
                // any actions that execute if someObject receives someEvent
                document.write("<h2>"+someParameter+"</h2>");
            });
            // send event to the object using trigger()
            someObject.trigger("someEvent", "Hello from BackboneJS");
        </script>

    </div>
    </form>
</body>
</html>
