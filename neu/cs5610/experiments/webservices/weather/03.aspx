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

        ul.horizontal li {
            list-style-type: none;
            padding-right: 20px;
            white-space: nowrap;
        }

        ul.horizontal li:nth-child(odd) {
            background-color : lightblue;
        }
        ul.horizontal li:nth-child(even) {
            background-color : beige;
        }

        #pure {
            display: none;
            padding:0px;
            margin:0px;
        }
    </style>
</head>
<body>
    <h1>World Weather Online REST Client</h1>
    Here's a simple REST client to <a href="http://free.worldweatheronline.com/">World Weather Online's REST Service</a>.
    <h2>Query</h2>
    Weather for <a href="http://api.worldweatheronline.com/free/v1/weather.ashx?q=01827,USA&format=json&num_of_days=2&key=s3uv4fjbaw4pqtp26rh48afd">My ZIP</a><br/>
    <a href="http://net4.ccs.neu.edu/home/jga/fileview/Default.aspx?~/experiments/webservices/weather/03.aspx">Source</a><br/>
    API Key:<input type="text" id="key" value="s3uv4fjbaw4pqtp26rh48afd" /><br />
    Format: <select id="format">
                <option>json</option>
            </select><br/>
    Days:   <input type="text" id="days" value="3" /><br/>
    Zip:    <select id="zip">
                <option value="01827">Dunstable (01827)</option>
                <option value="02108">Boston (02108)</option>
                <option value="10705">Yonkers, New York (10705)</option>
            </select><br/>
    <button id="go">Get Weather</button>

    <h2>Response</h2>
    Click on the Get Weather button to query for the weather.
    <ul id="pure" class="horizontal">
        <li class="day">
            <table class="details">
                <tr class="date"><td class="name">Date</td><td class="value"></td></tr>
                <tr class="precipMM"><td class="name">Precipitation (mm)</td><td class="value"></td></tr>
                <tr class="tempC"><td class="name">Temperature &deg;C</td><td class="value"></td></tr>
                <tr class="tempF"><td class="name">Temperature &deg;F</td><td class="value"></td></tr>
                <tr class="weatherDesc"><td class="name">Conditions</td><td class="value"></td></tr>
                <tr class="weatherIconUrl"><td class="name">Image</td><td class="value"><img /></td></tr>
                <tr class="winddirection"><td class="name">Wind Direction</td><td class="value"></td></tr>
                <tr class="windspeedKmph"><td class="name">Wind Speed (Km/h)</td><td class="value"></td></tr>
                <tr class="windspeedMiles"><td class="name">Wind Speed (mi/h)</td><td class="value"></td></tr>
            </table>
        </li>
    </ul>

    <h2>JSON Response</h2>
    This is the JSON object response (pretty printed) from the REST service. Click on the table headers to toggle table body.
    <div id="response"></div>

    <script src="../../js/jquery.js"></script>
    <script src="../../pure/pure.js"></script>
    <script src="../../js/prettyprint.js"></script>
    <script>

        var directive = {
            '#pure .day' : {
                'weather<-response.data.weather': {
                    'tr.date td.value': 'weather.date',
                    'tr.precipMM td.value': 'weather.precipMM',
                    'tr.tempC td.value': '#{weather.tempMinC}&deg; to #{weather.tempMaxC}&deg; C',
                    'tr.tempF td.value': '#{weather.tempMinF}&deg; to #{weather.tempMaxF}&deg; F',
                    'tr.weatherDesc td.value': function () { return this.weatherDesc[0].value;},
                    'tr.weatherIconUrl td.value img@src': function () { return this.weatherIconUrl[0].value; },
                    'tr.winddirection td.value': 'weather.winddirection',
                    'tr.windspeedKmph td.value': 'weather.windspeedKmph',
                    'tr.windspeedMiles td.value': 'weather.windspeedMiles'
                }
            }
        };

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

                    $("#response thead").click(toggleTbody);
                    $("#response tbody").each(function () {
                        $(this).css("display", "none");
                    });

                    var children = $("#pure").children();
                    for (var c = 0; c < children.length; c++) {
                        if (c == 0) continue;
                        $(children[c]).remove();
                    }

                    $('#pure').render({ 'response': response }, directive);
                    $('#pure').show();
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
