<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>JSON &amp; AJAX</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css" />
        <script src="../js/jquery.js"></script>

	    <script>
	        $(function () {
	            $.ajax({
	                "url": "json-from-server-service.aspx",
                    "dataType" : "json",
	                "success": function (person) {
	                    $("#firstName").html(person.first);
	                    $("#lastName").html(person.last);
	                    $("#dateOfBirth").html(person.dob);
	                }
	            });
	        });
        </script>
    </head>
    <body>
        <div class="ninesixty">

            <h1>JSON &amp; AJAX</h1>

			<a href="../fileview/Default.aspx?~/json/json-from-server-client.aspx" target="_blank">View Source</a>

            <p>
                JSON can be used to represent server side data. We can retrieve the data using AJAX
                or Asynchronous JavaScript and XML. Using AJAX, we can request data from the server
                programmatically and update the Web page without reloading the page. As an example,
                consider the following list of values representing some person:
            </p>

            <ul>
                <li>First name: <span id="firstName">&nbsp;</span></li>
                <li>Last name: <span id="lastName">&nbsp;</span></li>
                <li>Date of Birth: <span id="dateOfBirth">&nbsp;</span></li>
            </ul>

            <p>
                The values rendered in the list above are not there when the page inially loads.
                In fact, the list actually contains blank spaces as shown below:
            </p>

            <pre>
    &lt;ul&gt;
        &lt;li&gt;First name: &lt;span id=&quot;firstName&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
        &lt;li&gt;Last name: &lt;span id=&quot;lastName&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
        &lt;li&gt;Date of Birth: &lt;span id=&quot;dateOfBirth&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
    &lt;/ul&gt;
            </pre>

            <p>
                JQuery provides a simple AJAX API to dynamically retrieve data from the server.
                Here we illustrate a simple subset, but <a href="http://api.jquery.com/jQuery.ajax/">
                I encourage you to explore it further.</a> For our simple example, we use the simple
                script below that uses AJAX to request the server for the data right after the page loads.
            </p>

            <pre>
    $(function () {
	    $.ajax({
	        &quot;url&quot;: &quot;json-from-server-service.aspx&quot;,
	        &quot;dataType&quot; : &quot;json&quot;,
	        &quot;success&quot;: function (person) {
	            $(&quot;#firstName&quot;).html(person.first);
	            $(&quot;#lastName&quot;).html(person.last);
	            $(&quot;#dateOfBirth&quot;).html(person.dob);
	        }
	    });
	});
            </pre>

            <p>
                The script above uses 3 of many configurable properties of the AJAX API. The <b>url</b>
                property configures the URL location of the server side resource that will fulfill
                our request. In this case it is another ASPX page. The script is expecting a JSON
                response as configured by the <b>dataType</b> property. The AJAX API is very smart
                and if you leave out the dataType property it will try to figure it out from the MIME
                in the response from the server. The url property could point to any server side
                resource as long as it generates some JSON to consume. <a href="json-from-server-service.aspx" target="_blank">
                Try visiting the resource and notice that the response is a valid JSON string.</a>
                Verify that the following JSON is returned:
            </p>
            <pre>
    {&quot;first&quot;: &quot;John&quot;, &quot;last&quot;: &quot;Doe&quot;, &quot;dob&quot;: &quot;11/22/68&quot;}
            </pre>
            <p>
                The <b>success</b> property allows declaring a callback function that is called if
                the request is successful. An optional <b>error</b> option can be used to declare a
                callback function called if there was an error (not shown). Our success function
                accepts a <b>person</b> argument which in this case contains the JSON data response
                from the server. Notice that the JSON returned in the response is assigned to the
                person argument, and then we access its attributes <b>first</b>, <b>last</b>, and
                <b>dob</b>. We use the attributes to dynamically populate the list.
            </p>
            <p>
                The server generates the JSON response as follows
            </p>
            <pre>
    &lt;%@ Page Language=&quot;C#&quot;%&gt;

    &lt;%
        string json = &quot;{\&quot;first\&quot;: \&quot;John\&quot;, \&quot;last\&quot;: \&quot;Doe\&quot;, \&quot;dob\&quot;: \&quot;11/22/68\&quot;}&quot;;
        Response.Clear();
        Response.ContentType = &quot;application/json; charset=utf-8&quot;;
        Response.Write(json);
        Response.End();
    %&gt;
            </pre>

            <p>
                The server creates a valid JSON string, then clears the response, sets the MIME type
                to application/json with ContentType header, and then writes the json string to
                the response. The client receives the JSON string and parses it into a JSON
                object that is then used to populate our list.
            </p>

        </div>
    </body>
</html>
