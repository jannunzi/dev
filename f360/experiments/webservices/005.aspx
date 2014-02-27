<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.10.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Creating a Webservice</h1>

        <ul>
            <li>
                Right click on solution, Add, Add New Item, Web Service (ASMX),
                name the Web Service, e.g., "UserService.asmx", click Add
            </li>
            <li>
                Uncomment <b>// [System.Web.Script.Services.ScriptService]</b>
                so we can access the service from a Web JavaScript client
            </li>
            <li>
                Execute the Web service and test it by clicking the HelloWorld
                link and then the Invoke button
            </li>
            <li>
                Note the link of the Web service, e.g.,
                http://localhost:50341/UserService.asmx/HelloWorld.
                If you copy this URL to a browser it will fail since
                the service is configured to only respond to POST.
                Nevertheless, this URL is the end point of the Web service
                we use to invoke the service from a JavaScript client.
            </li>
            <li>
                The URL can be invoked with the following AJAX:
                <pre>
$.ajax({
    url: &quot;http://localhost:50341/UserService.asmx/HelloWorld&quot;,
    type: &quot;post&quot;,
    contentType: &quot;application/json&quot;,
    success: function (response) {
        console.log(response);
    }
});</pre>
            </li>
            <li>
                Click the button bellow to invoke the service programmatically<br/>
                <button class="btn btn-primary btn-block" id="invokeService">Invoke Service</button><br />
            </li>
            <li>
                Here's the response:<br />
                <input class="response form-control"/>
            </li>
        </ul>

    </div>
    </form>

    <script>
        $(function () {
            $("#invokeService").click(invokeService);
        })

        function invokeService(event) {
            event.preventDefault();
            $.ajax({
                url: "http://localhost:50341/UserService.asmx/HelloWorld",
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    response = JSON.stringify(response);
                    $(".response").val(response);
                }
            });
        }
    </script>
</body>
</html>
