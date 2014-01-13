<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>JSON Intro</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css" />
        <script src="../js/jquery.js"></script>

	    <script>
	        var person = {
	            "first": "John",
	            "last": "Doe",
	            "dob": "11/22/68"
	        };

	        var csDept   = { "name": "Computer Science Department", "students": 789 };
	        var chemDept = { "name": "Chemical Engineering Department", "students": 890 };
	        var mechDept = { "name": "Mechanical Engineering Department", "students": 567 };

	        var university = {
	            "name": "Northeastern University",
	            "departments": [csDept, chemDept, mechDept]
	        };

	        $(function () {
	            $("#firstName").html(person.first);
	            $("#lastName").html(person.last);
	            $("#dateOfBirth").html(person.dob);

	            $("#university").html(university.name);
	            for (var i = 0; i < university.departments.length; i++) {
	                var li = $("<li>").append(university.departments[i].name);
	                $("#departments").append(li);
	            }

	            var jsonStr = JSON.stringify(university);
	            $("#universityJson").val(jsonStr);
	        });
        </script>
    </head>
    <body>
        <div class="ninesixty">

            <h1>JSON Introduction</h1>

            <a href="../fileview/Default.aspx?~/json/json-intro.aspx" target="_blank">View Source</a>

            <p>
                JSON stands for JavaScript Object Notation, and allows representing structured data
                that simplifies data manipulation and sharing. The following JSON object can represent
                a person with various attributes such as first and last name, and date of birth.
            </p>

            <pre>
    var person = {
	    &quot;first&quot;: &quot;John&quot;,
	    &quot;last&quot;: &quot;Doe&quot;,
	    &quot;dob&quot;: &quot;11/22/68&quot;
	};
            </pre>

            <h2>Dynamically Rendering JSON Object</h2>

            <p>
                From jQuery (or plain JavaScript) we can use the JSON object to render the data into
                the list shown below. Note that the list contains no values, just place holders where
                we will dynamically populate the data.
            </p>

            <pre>
    &lt;ul&gt;
        &lt;li id=&quot;firstName&quot;&gt;&amp;nbsp;&lt;/li&gt;
        &lt;li id=&quot;lastName&quot;&gt;&amp;nbsp;&lt;/li&gt;
        &lt;li id=&quot;dateOfBirth&quot;&gt;&amp;nbsp;&lt;/li&gt;
    &lt;/ul&gt;
            </pre>

            <p>
                The JavaScript below accesses each attribute in the JSON object and updates the HTML
                content of each of the HTML elements:
            </p>

            <pre>
    $(function () {
	    $(&quot;#firstName&quot;).html(person.first);
	    $(&quot;#lastName&quot;).html(person.last);
	    $(&quot;#dateOfBirth&quot;).html(person.dob);
    });
            </pre>

            <p>
                Here's the resulting list dynamically updated from JavaScript:
            </p>

            <ul>
                <li id="firstName">&nbsp;</li>
                <li id="lastName">&nbsp;</li>
                <li id="dateOfBirth">&nbsp;</li>
            </ul>

            <h2>Arbitrarily Complex JSON Objects</h2>

            <p>
                JSON objects can be arbitrarily nested containing nested objects and arrays of objects
                as shown below
            </p>

            <pre>
	var csDept   = { &quot;name&quot;: &quot;Computer Science Department&quot;, &quot;students&quot;: 789 };
	var chemDept = { &quot;name&quot;: &quot;Chemical Engineering Department&quot;, &quot;students&quot;: 890 };
	var mechDept = { &quot;name&quot;: &quot;Mechanical Engineering Department&quot;, &quot;students&quot;: 567 };

	var university = {
	    &quot;name&quot;: &quot;Northeastern University&quot;,
	    &quot;departments&quot;: [csDept, chemDept, mechDept]
	};
            </pre>

            <p>
                The following JavaScript snippet uses the JSON object to update the HTML shown below.
                The script updates the element with the university id, and then iterates over the array
                of departments using the names of the departments to dynamically create line items
                that are added to the departments list. The resulting DOM is shown 
            </p>

            <pre>
	$(function () {
	    $(&quot;#university&quot;).html(university.name);
	    for (var i = 0; i &lt; university.departments.length; i++) {
	        var li = $(&quot;&lt;li&gt;&quot;).append(university.departments[i].name);
	        $(&quot;#departments&quot;).append(li);
	    }
	});

	&lt;h3 id=&quot;university&quot;&gt;&amp;nbsp;&lt;/h3&gt;

	&lt;h3&gt;Departments&lt;/h3&gt;

	&lt;ul id=&quot;departments&quot;&gt;
	&lt;/ul&gt;
            </pre>

            <h3 id="university">&nbsp;</h3>

            <h3>Departments</h3>

            <ul id="departments">
            </ul>

            <h2>
                Converting JSON From / To Strings
            </h2>

            <p>
                Often times JSON needs to be represented as strings or parsed from strings.
                Use the JSON.parse() and JSON.stringify() to parse strings into JSON objects
                or generate a string from a JSON object. Below is a string representation of
                the university object used in the example above.
            </p>

            <textarea id="universityJson" cols="40", rows="10">
            </textarea>

            <br/>
        </div>
    </body>
</html>