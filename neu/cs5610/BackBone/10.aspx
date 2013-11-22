<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10.aspx.cs" Inherits="js_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="js/jquery-ui-1.10.3/themes/base/jquery-ui.css" />
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
    <script src="js/underscore.js"></script>
    <script src="js/backbone.js"></script>

    <style>.vertex {width:100px;height:100px;background-color:blue;color:white;}</style>

</head>
<body>
    <div>

        <h1>Backbone Models</h1>
        <div class="vertex">Vertex</div>
        <script>
            var Vertex = Backbone.Model.extend({

            });
        </script>

    </div>
</body>
</html>
