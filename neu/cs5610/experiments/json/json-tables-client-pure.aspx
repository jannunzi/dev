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
        <script src="../pure/pure.js"></script>
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
	            var directive = {
	                '#table thead tr th': {
	                    'header<-table.headers': {
	                        '.': 'header'
	            }},
	                '#table tbody tr' : {
	                    'row<-table.rows': {
                            'td' : {
                                'content<-row.data': {
                                    '.': 'content'
                }}}}};

                $('#table').render({ 'table': table }, directive);
	        }
        </script>
    </head>
    <body>
        <div class="ninesixty">

	    	    <a href="../fileview/Default.aspx?~/json/json-tables-client-pure.aspx" target="_blank">View Source</a>
	    	    
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

        </div>
    </body>
</html>
