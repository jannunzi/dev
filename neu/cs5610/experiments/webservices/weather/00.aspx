<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JSONP</title>
    <style>
        th:first-child {
            width : 1px;
        }
    </style>
</head>
<body>
    <h2>Query</h2>
    Weather for My ZIP:
    <a id="url" href="http://api.worldweatheronline.com/free/v1/weather.ashx?q=01827,USA&format=json&num_of_days=2&key=s3uv4fjbaw4pqtp26rh48afd">
    </a>
    <br/>
    <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/webservices/weather/00.aspx">Source</a><br/>
    <button id="go">Get JSONP Weather</button>
    <h2>Response</h2>
    <div id="response"></div>

    <script src="../../js/jquery.js"></script>
    <script src="../../js/prettyprint.js"></script>
    <script>
        var url = $("#url").attr("href");

        $("#go").click(getWeather);

        function getWeather() {

            $.ajax({
                url: url,
                dataType: "jsonp",
                success: function (response) {
                    console.log(response);
                    var table = prettyPrint(response, { maxDepth: 10 });
                    $("#response").html(table);
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    </script>
</body>
</html>
