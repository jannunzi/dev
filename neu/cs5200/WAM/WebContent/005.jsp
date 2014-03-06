<%@ page import="java.sql.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="005.jsp" method="post">

<div class='container'>

<h2>WAM</h2>

<a href="005.jsp?action=preview">Preview</a>

<%

String url = "jdbc:mysql://localhost/cs3200";
String driver = "com.mysql.jdbc.Driver";

int id, top, left, width, height, editId = -1;
String name, bgColor, fgColor, content;
String action;

String selectAllWidgets  = "SELECT * FROM WIDGET;";
String deleteWidgetForId = "DELETE FROM WIDGET WHERE ID=?";
String insertWidget      = "INSERT INTO WIDGET VALUES (NULL,?,?,?,?,?,?,?,?)";
String updateWidget      = "UPDATE WIDGET SET NAME=?, TOP=?, CONTENT=? WHERE ID=?";

Connection connection = null;
PreparedStatement stmt = null;
ResultSet results = null;

try {
	Class.forName (driver).newInstance();
	connection = DriverManager.getConnection (url, "root", null);
	
	action = request.getParameter("action");
	
	if("delete".equals(action)) {
		id = Integer.parseInt(request.getParameter("id"));
		stmt = connection.prepareStatement(deleteWidgetForId);
		stmt.setInt(1, id);
		stmt.executeUpdate();
	} else if("add".equals(action)) {
		stmt = connection.prepareStatement(insertWidget);
		name = request.getParameter("name");
		content = request.getParameter("content");
		stmt.setString(1, name);
		stmt.setInt(2, 123);
		stmt.setInt(3, 234);
		stmt.setInt(4, 345);
		stmt.setInt(5, 456);
		stmt.setInt(6, 567);
		stmt.setInt(7, 678);
		stmt.setString(8, content);
		stmt.executeUpdate();
	} else if("edit".equals(action)) {
		editId = Integer.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Integer.parseInt(request.getParameter("id"));
		name = request.getParameter("newName");
		content = request.getParameter("newContent");
		stmt = connection.prepareStatement(updateWidget);
		stmt.setString(1, name);
		stmt.setInt(2, 123);
		stmt.setString(3, content);
		stmt.setInt(4, id);
		stmt.executeUpdate();
	} else if("preview".equals(action)) {
		stmt = connection.prepareStatement(selectAllWidgets);
		results = stmt.executeQuery();
		while(results.next()) {
			id = results.getInt("id");
			name = results.getString("name");
			content = results.getString("content");
			bgColor = results.getString("bgColor");
			fgColor = results.getString("fgColor");
%>
			<div style="background-color:<%= bgColor %>;color:<%= fgColor %>">
				<%= content %>
			</div>
<%
		}
	}
	
	
	stmt = connection.prepareStatement(selectAllWidgets);
	results = stmt.executeQuery();
%>
	<table class="table">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Content</th>
			<th>Controls</th>
		</tr>
		<tr>
			<th></th>
			<th><input name="name"    class="form-control"    placeholder="Name"/></th>
			<th><input name="content" class="form-control"    placeholder="Content"/></th>
			<th><button name="action" class="btn btn-primary" value="add">Add</button></th>
		</tr>
<%
	while(results.next()) {
		id      = results.getInt("id");
		name    = results.getString("name");
		content = results.getString("content");

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td><input name="newContent" value="<%= content %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="005.jsp">Cancel</a>
				<input type="hidden" name="id" value="<%= id %>"/>
			</td>
		</tr>
<%
		} else {		
%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td><%= content %></td>
			<td>
				<a href="005.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="005.jsp?action=edit&id=<%= id %>">Edit</a>
			</td>
		</tr>

<%		}
	}
%>
	</table>
<%
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	try {
		connection.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}



%>
</div>

</form>