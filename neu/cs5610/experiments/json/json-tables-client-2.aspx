<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>JSON Table Service Client</title>
        <link rel="stylesheet" type="text/css" href="../css/main.css" />
        <style>
            th, td {
                text-transform: capitalize;
                padding : 5px;
            }
            thead tr th {
                background-color: black;
                color: white;
            }
            tbody tr:nth-child(even) td {
                background-color : lightgray;
            }
            tbody tr:nth-child(odd) td {
                background-color : lightblue;
            }
        </style>
        <script src="../js/jquery.js"></script>
	    <script>
	        $(function () {
	            var tableFromJson = $("#table-from-json");
	            $.ajax({
	                "url": "json-tables-service.aspx",
	                "dataType": "json",
	                "data" : {"tableName" : "Movies"},
	                "success": populateTable
	            });
	        });

	        function populateTable(table) {
	            populateTableHeader(table.headers);
	            populateTableRows(table.rows);
	        }

	        function populateTableHeader(headers) {
	            console.log(headers);
	            var tHeadRow = $("#table thead tr");
	            var tHeadRowDataTemplate = $("#table thead tr th").clone();
	            $("#table thead tr th").remove();
	            for (var h in headers) {
	                var header = headers[h];
	                var th = tHeadRowDataTemplate.clone().html(header);
	                tHeadRow.append(th);
	            }
	        }
	        function populateTableRows(rows) {
	            console.log(rows);
	            var tBody = $("#table tbody");
	            var tBodyRowTemplate = $("#table tbody tr").clone();
	            var tBodyDataTemplate = $("#table tbody tr td").clone();
	            tBodyRowTemplate.empty();
	            $("#table tbody tr").remove();
	            for (var r in rows) {
	                var row = rows[r];
	                var tr = tBodyRowTemplate.clone();
	                for (var d in row.data) {
	                    var data = row.data[d];
	                    var td = tBodyDataTemplate.clone();
	                    td.html(data);
	                    tr.append(td);
	                }
	                tBody.append(tr);
	            }
	        }
        </script>
    </head>
    <body>
        <div class="ninesixty">

	    	    <a href="../fileview/Default.aspx?~/json/json-tables-client-2.aspx" target="_blank">View Source</a>

            <table id="table">
                <thead>
                    <tr>
                        <th>Head</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Data</td>
                    </tr>
                </tbody>
            </table>

            <h2>Data Model</h2>

            The data we are rendering is represented on the server by classes Row and Table.
            These two classes represent the data model of the application. The data model is
            unaware of how it will represented on the client. The data model can maintain
            the state of the application, encapsulate business logic, and be used to persist
            to the database. The Row class is just a container of a list of generic data.
            The Table class has a neam a list of headers, and a list of rows.

            <pre>
    namespace edu.neu.ccis.jga.tables
    {
        public class Row
        {
            public Row(List&lt;Object&gt; data)
            {
                if (data == null)
                    this.data = new List&lt;Object&gt;();
                else
                    this.data = data;
            }
            public List&lt;Object&gt; data { set; get; }
        }
    }

    namespace edu.neu.ccis.jga.tables
    {
        public class Table
        {
            public Table(string name, List&lt;string&gt; headers, List&lt;Row&gt; rows)
            {
                this.name = name;
                this.headers = headers;
                this.rows = rows;
            }
            public string name { set; get; }
            public List&lt;string&gt; headers { set; get; }
            public List&lt;Row&gt; rows { set; get; }
        }
    }
            </pre>

            Instead of creating Table and Row instances spread across several pages or classes,
            it is often a good idea to encapsulate all lifecycle management behind a well defined
            API. For instance, the class TableService below declares method getTableByName() which,
            as the name suggests, would retrieve an instance of a table whose name is given by
            the argument. The method can hide the details of how such tables are retrieved, where
            they live, and how they are persisted, or not. Other methods that would live in this
            service could be: createTable(), deleteTableByName(), getAllTables(). Note that the class
            contains several static methods for which there is no need to create an instance to
            use its methods. This strategy is sometimes referred to as a singleton.

            <pre>
    namespace edu.neu.ccis.jga.tables
    {
        public class TableService
        {
            public TableService() { ... }

            public static List&lt;Table&gt; tables { set; get; }

            public static Table getTableByName(string tableName) { ... }
            public static Table createTable() { ... }
            public static bool deleteTableByName(string tableName) { ... }
            public static List&lt;Table&gt; getAllTables() { ... }
        }
    }
            </pre>

            The TableService class is unaware that it is being used in a Web application.
            It could as well be used in a desktop application or command line application.
            In our paticular implementation, we will make the service available through
            HTTP by wrapping it with an ASP page. The page takes as argument the name of
            a table as shown below. The page uses the TableService to retrieve the table
            by name, serialize the table instance into a JSON object, and then writes
            JSON to the response.

            <pre>
    &lt;%
        string tableName = Request.QueryString[&quot;tableName&quot;];
    
        edu.neu.ccis.jga.tables.Table table = TableService.getTableByName(tableName);
    
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        string json = serializer.Serialize(table);
    
        Response.Clear();
        Response.ContentType = &quot;application/json; charset=utf-8&quot;;
        Response.Write(json);
        Response.End();
    %&gt;
            </pre>

            <a href='json-tables-service.aspx'>Here's an example of the JSON returned by the ASP page</a>

            <pre>
    $(function () {
	    var tableFromJson = $(&quot;#table-from-json&quot;);
	    $.ajax({
	        &quot;url&quot;: &quot;json-tables-service.aspx&quot;,
	        &quot;dataType&quot;: &quot;json&quot;,
	        &quot;data&quot; : {&quot;tableName&quot; : &quot;Movies&quot;},
	        &quot;success&quot;: populateTable
	    });
	});
            </pre>

            <pre>
    function populateTable(table) {
	    populateTableHeader(table.headers);
	    populateTableRows(table.rows);
	}

	function populateTableHeader(headers) {
	    console.log(headers);
	    var tHeadRow = $(&quot;#table thead tr&quot;);
	    var tHeadRowDataTemplate = $(&quot;#table thead tr th&quot;).clone();
	    $(&quot;#table thead tr th&quot;).remove();
	    for (var h in headers) {
	        var header = headers[h];
	        var th = tHeadRowDataTemplate.clone().html(header);
	        tHeadRow.append(th);
	    }
	}
            </pre>

            <pre>
            function populateTableRows(rows) {
	            console.log(rows);
	            var tBody = $(&quot;#table tbody&quot;);
	            var tBodyRowTemplate = $(&quot;#table tbody tr&quot;).clone();
	            var tBodyDataTemplate = $(&quot;#table tbody tr td&quot;).clone();
	            tBodyRowTemplate.empty();
	            $(&quot;#table tbody tr&quot;).remove();
	            for (var r in rows) {
	                var row = rows[r];
	                var tr = tBodyRowTemplate.clone();
	                for (var d in row.data) {
	                    var data = row.data[d];
	                    var td = tBodyDataTemplate.clone();
	                    td.html(data);
	                    tr.append(td);
	                }
	                tBody.append(tr);
	            }
	        }
            </pre>

        </div>
    </body>
</html>
