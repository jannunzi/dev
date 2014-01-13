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
	        var tHead, tBody;
	        $(function () {
	            tHead = $("#table thead");
	            tBody = $("#table tBody");
	            var tableFromJson = $("#table-from-json");
	            $.ajax({
	                "url": "json-tables-service.aspx",
	                "dataType": "json",
	                "data" : {"tableName" : "Movies"},
	                "success": populateTable
	            });
	        });

	        function populateTable(tableJson) {
	            populateHeader(tableJson.headers);
	            populateRows(tableJson.rows);
            }
	        function populateHeader(headers) {
	            var tr = $("<tr>");
	            for (var h in headers) {
	                var header = headers[h];
	                var th = $("<th>").append(header);
	                tr.append(th);
	            }
	            tHead.append(tr);
	        }
	        function populateRows(rows) {
	            for (var r in rows) {
	                var tr = $("<tr>");
	                var data = rows[r].data;
	                for (var c in data) {
	                    var col = data[c];
	                    var td = $("<td>").append(col);
	                    tr.append(td);
	                }
	                tBody.append(tr);
	            }
	        }
        </script>
    </head>
    <body>
        <div class="ninesixty">

	    	    <a href="../fileview/Default.aspx?~/json/json-tables-client-1.aspx" target="_blank">View Source</a>

            <table id="table">
                <thead></thead>
                <tbody></tbody>
            </table>

        </div>
    </body>
</html>
