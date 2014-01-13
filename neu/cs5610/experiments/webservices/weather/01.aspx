<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    Weather for <a href="http://api.worldweatheronline.com/free/v1/weather.ashx?q=01827,USA&format=json&num_of_days=2&key=s3uv4fjbaw4pqtp26rh48afd">My ZIP</a><br/>
    <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/webservices/weather/01.aspx">Source</a><br/>
    API Key: <input type="text" id="key" value="s3uv4fjbaw4pqtp26rh48afd" /><br />
    Format: <select id="format">
                <option>json</option>
                <option>xml</option>
            </select><br/>
    Days:   <input type="text" id="days" value="2" /><br/>
    Zip:    <select id="zip">
                <option value="01827">Dunstable</option>
                <option value="02108">Boston</option>
                <option value="10705">Yonkers, New York</option>
            </select><br/>
    <button id="go">Get Weather</button>

    <div id="response"></div>

    <script src="../../js/jquery.js"></script>
    <script src="../../js/prettyprint.js"></script>
    <script>

        var urlTemplate = "http://api.worldweatheronline.com/free/v1/weather.ashx?q=ZIP,USA&format=FORMAT&num_of_days=DAYS&key=KEY";
        var keyField = $("#key");
        var formatField = $("#format");
        var daysField = $("#days");
        var zipField = $("#zip");
        var go = $("#go");

        go.click(getWeather);

        function getWeather() {

            var formatValue = formatField.val();
            var daysValue = daysField.val();
            var zipValue = zipField.val();
            var keyValue = keyField.val();

            var url = new String(urlTemplate);
            url = url.replace("FORMAT", formatValue);
            url = url.replace("DAYS", daysValue);
            url = url.replace("KEY", keyValue);
            url = url.replace("ZIP", zipValue);

            var data = {
                "q": zipValue,
                "format": formatValue,
                "num_of_days": daysValue,
                "key": keyValue
            };

            $.ajax({
                url: "http://api.worldweatheronline.com/free/v1/weather.ashx",
                dataType: "jsonp",
                data : data,
                success: function (response) {
                    console.log(response);
                    var table = prettyPrint(response, { maxDepth: 10 });
                    $("#response").html(table);
                },
                error: function (e) { console.log(e);}
            });
        }
    </script>
</body>
</html>
