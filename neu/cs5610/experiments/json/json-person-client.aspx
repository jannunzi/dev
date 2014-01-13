<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Person Client</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css" />
        <script src="../js/jquery.js"></script>

	    <script>
	        $(function () {
	            $.ajax({
	                "url": "json-person-service.aspx",
                    "dataType" : "json",
	                "success": function (person) {
	                    $("#firstName").html(person.first);
	                    $("#lastName").html(person.last);
	                    var dobJson = person.dob;
	                    var dobDate = new Date(parseInt(dobJson.substr(6)));
	                    $("#dateOfBirth").html(dobDate);
	                }
	            });
	        });
        </script>
    </head>
    <body>
        <div class="ninesixty">

            <h1>Person Client</h1>

			<a href="../fileview/Default.aspx?~/json/json-person-client.aspx" target="_blank">View Source</a>

            <p>
                The previous example showed how to generate JSON from the server and retrieve it
                and process it with AJAX. The example used a hard coded string to represent JSON.
                Working with strings on the server is both tedious and error prone. Instead we
                will typically be working with well thought out data model with sophisticated
                business rules and persisted to some data source as a database or network source.
            </p>

            <p>
                Here's the same list populated dynamically with JSON retrieved from the server
                via AJAX, but this time the JSON is generated from an object instance. The date
                is the same date as the previous example, but since it's a real date and not
                a plain string, it renders differently. We can always format it later.
            </p>

            <ul>
                <li>First name: <span id="firstName">&nbsp;</span></li>
                <li>Last name: <span id="lastName">&nbsp;</span></li>
                <li>Date of Birth: <span id="dateOfBirth">&nbsp;</span></li>
            </ul>

            <p>
                The list is the same as before. It contains no values, just placeholders for
                jQuery to fill in with the JSON results from the server via AJAX.
            </p>

            <pre>
    &lt;ul&gt;
        &lt;li&gt;First name: &lt;span id=&quot;firstName&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
        &lt;li&gt;Last name: &lt;span id=&quot;lastName&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
        &lt;li&gt;Date of Birth: &lt;span id=&quot;dateOfBirth&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/li&gt;
    &lt;/ul&gt;
            </pre>

            <p>
                The script is slightly modified to parse the date into a JavaScrip date instance
            </p>

            <pre>
    $(function () {
        $.ajax({
            "url": "json-person-service.aspx",
            "dataType" : "json",
            "success": function (person) {
                $("#firstName").html(person.first);
                $("#lastName").html(person.last);
                var dobJson = person.dob;
                var dobDate = new Date(parseInt(dobJson.substr(6)));
                $("#dateOfBirth").html(dobDate);
            }
        });
    });
            </pre>

            <p>
                The JSON returned from the server is slightly different for the date since it's
                a real date instance as opposed to just a string. We are using a DateTime instance
                which serializes in the format /Date(########)/ where the number in parenthesis are
                the miliseconds from a 1970. <a href="json-person-service.aspx" target="_blank">
                Verify that the JSON is as shown below.</a>
            </p>
            <pre>
    {"first":"John","last":"Doe","dob":"\/Date(-34974000000)\/"}
            </pre>
            <p>
                The server uses the JavaScriptSerializer to convert an object instance into JSON
                string representation. In this example we are serializing an instance of the Person
                class which has been initialized with the first and last names, and date of birth.
                We then write the json string to the response after having configured the content
                type of the response header.
            </p>
            <pre>
    &lt;%@ Page Language=&quot;C#&quot;%&gt;
    &lt;%@ Import Namespace=&quot;edu.neu.ccis.jga&quot; %&gt;
    &lt;%@ Import Namespace=&quot;System.Web.Script.Serialization&quot; %&gt;

    &lt;%
        Person john = new Person(&quot;John&quot;, &quot;Doe&quot;, new DateTime(1968,11,22));
    
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        string json = serializer.Serialize(john);
    
        Response.Clear();
        Response.ContentType = &quot;application/json; charset=utf-8&quot;;
        Response.Write(json);
        Response.End();
    %&gt;
            </pre>

            <p>
                The Person class is shown below.
            </p>

            <pre>
    using System;

    namespace edu.neu.ccis.jga
    {
        public class Person
        {
            public Person() { }

            public Person(string fn, string ln, DateTime dob)
            {
                this.first = fn;
                this.last = ln;
                this.dob = dob;
            }

            public string first { set; get; }
            public string last { set; get; }
            public DateTime dob { set; get; }
        }
    }
            </pre>

        </div>
    </body>
</html>
