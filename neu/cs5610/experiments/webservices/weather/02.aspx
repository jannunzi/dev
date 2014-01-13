<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JSONP & Form</title>
    <style>
        th:first-child {
            width : 1px;
        }
        input, select {
            width: 200px;
            left : 80px;
            position : absolute;
        }
    </style>
</head>
<body>
    <h2>Query</h2>
    Weather for <a href="http://api.worldweatheronline.com/free/v1/weather.ashx?q=London&format=json&num_of_days=5&key=s3uv4fjbaw4pqtp26rh48afd">My ZIP</a><br/>
    <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/webservices/weather/02.aspx">Source</a><br/>
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

    <h2>Response</h2>
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

                    $("thead").click(toggleTbody);
                    $("tbody").each(function () {
                        $(this).css("display", "none");
                    });
                },
                error: function (e) { console.log(e);}
            });
        }

        function toggleTbody() {
            var thead = $(this);
            var table = thead.parent("table");
            var tbody = table.find("> tbody");
            tbody.toggle();
        }
    </script>
</body>
</html>
