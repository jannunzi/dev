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

        <h1>Responding with Object from Web Service</h1>

        <div class="row">
            <div class="col-sm-6">
        <ol>
            <li>
                Create an object, e.g., TripTO.cs
                <pre>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TripTO
{
    public TripTO() {}
    public TripTO(string name,
                  DateTime start,
                  DateTime end)
    {
        this.name = name;
        this.startDate = start;
        this.endDate = end;
    }
    protected string name { set; get; }
    protected DateTime startDate { set; get; }
    protected DateTime endDate { set; get; }
}</pre>
            </li>
        </ol>
            </div>
            <div class="col-sm-6">
                <ol start="3">
                    <li>
                        Update the service
                        <pre>
[WebMethod]
public TripTO getTrip()
{
    TripTO trip = new TripTO(
                        "Trip 123",
                        new DateTime(),
                        new DateTime());
    return trip;
}</pre>
                    </li>
                    <li>Click button below to invoke the service<br />
                        <a href="#" id="invokeService" class="btn btn-primary btn-block">
                            Invoke Service
                        </a>
                    </li>
                    <li>Response:<br />
                        <textarea id="response" class="form-control">

                        </textarea>
                    </li>
                </ol>
            </div>
        </div>

    </div>
    </form>

    <script>
        $(function () {
            $("#invokeService").click(invokeService);
        })

        function invokeService(event) {
            event.preventDefault();
            $.ajax({
                url: "http://localhost:50341/UserService.asmx/getTrip",
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    response = JSON.stringify(response);
                    $("#response").val(response);
                }
            });
        }
    </script>
</body>
</html>
