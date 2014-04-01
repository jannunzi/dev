<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.atc.siterra.bup.service.*, com.atc.siterra.bup.model.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>

<form action="DatabaseExplorer.jsp">

<div class="container">

	<h1>Database Explorer</h1>
	
	<div class="row">
		<div class="col-xs-2">
			Database Type:
			<select class="database form-control">
				<option value="sqlserver2000">SQL Server 2000</option>
			</select>
		</div>
		<div class="col-xs-2">
			Database Name:
			<input class="databaseName form-control" 	placeholder="Database Name" value="ShareGen"/>
		</div>
		<div class="col-xs-2">
			Username:
			<input class="databaseUsername form-control" placeholder="Username" value="semaan_app_user"/>
		</div>
		<div class="col-xs-2">
			Password:
			<input class="databasePassword form-control" placeholder="Password" value="qcdb01" type="password"/>
		</div>
		<div class="col-xs-2">
			&nbsp;
			<button class="btn btn-success btn-block">Connect</button>
		</div>
	</div>
	
	<hr/>
	
	<div class="row">
		<div class="col-xs-3 scrollable">
			<table class="table">
				<thead>
					<tr>
<%
	TableService tableService = new TableService();
	List<Table> tables = tableService.getTables();
%>
						<th>Tables (<%= tables.size() %>)</th>
					</tr>
				</thead>
				<tbody>
<%	for(Table table : tables)
	{%>				<tr>
						<td><a href="database.jsp?table=<%= table.name %>"><%= table.name %></a></td>
					</tr>
<%	}%>			</tbody>
			</table>
		</div>
		<div class="col-xs-9">
			<table class="table">
				<thead>
					<tr>
<%	String tableName = request.getParameter("table");
	if(tableName != null)
	{
		List<Column> columns = tableService.getColumns(tableName);
%>
						<th>Fields (<%= columns.size() %>)</th>
						<th>Type</th>
						<th>Size</th>
					</tr>
				</thead>
				<tbody>
<%		for(Column col : columns)
		{%>			<tr>
						<td><%= col.name %></td>
						<td><%= col.type %></td>
						<td><%= col.size %></td>
					</tr>
<%		}
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>

</form>

</body>
</html>