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

        <h1>Responding with Nested Object from Web Service</h1>

        <div class="row">
            <div class="col-sm-6">
                <ol>
                    <li>
                        Create a parent object, e.g.,
                        <pre>
public class UserTO {
    public UserTO() { }
    public UserTO(string username, string password, TripTO[] trips) {
        this.username = username;
        this.password = password;
        this.trips = trips;
    }
    public string username;
    public string password;
    public TripTO[] trips;
}</pre>
                    </li>
                    <li>Modify the Web service to return a parent that contains
                        several child instances
                        <pre>
[WebMethod]
public UserTO getUserTrips()
{
    TripTO trip1 = new TripTO("Trip 123", new DateTime(), new DateTime());
    TripTO trip2 = new TripTO("Trip 234", new DateTime(), new DateTime());
    TripTO trip3 = new TripTO("Trip 345", new DateTime(), new DateTime());
    TripTO[] trips = { trip1, trip2, trip3 };

    UserTO user = new UserTO("username123", "password123", trips);
        
    return user;
}</pre>
                    </li>
                </ol>
            </div>
            <div class="col-sm-6">
                <ol start="3">
                    <li>
                        <a href="#" id="invokeService" class="btn btn-primary btn-block">
                            Invoke Service
                        </a>
                    </li>
                    <li>
                        Response:<br />
                        <textarea id="response" class="form-control" rows="20">

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
                url: "http://localhost:50341/UserService.asmx/getUserTrips",
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
