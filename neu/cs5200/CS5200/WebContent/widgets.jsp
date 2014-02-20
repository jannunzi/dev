<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="widgets.jsp">
<table>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Content</th>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input name="name"/></td>
		<td><input name="content"/></td>
		<td><button type="submit" name="action" value="add">Add Widget</button></td>
	</tr>
<%

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/cs5200";

int id;
String name, content;
String action;

String selectAllWidgets = "SELECT * FROM WIDGET;";
String insertNewWidget  = "INSERT INTO WIDGET VALUES (NULL, ?, ?)";
String deleteWidgetForId = "DELETE FROM WIDGET WHERE ID=?";

Connection connection = null;
PreparedStatement pstatement = null;
ResultSet results = null;

try {
	Class.forName (driver).newInstance();
	connection = DriverManager.getConnection (url, "root", null);
	
	action = request.getParameter("action");
	if("add".equals(action)) {
		name = request.getParameter("name");
		content = request.getParameter("content");
		pstatement = connection.prepareStatement(insertNewWidget);
		pstatement.setString(1, name);
		pstatement.setString(2, content);
		pstatement.executeUpdate();
	} else if("delete".equals(action)) {
		id = Integer.parseInt(request.getParameter("id"));
		pstatement = connection.prepareStatement(deleteWidgetForId);
		pstatement.setInt(1, id);
		pstatement.executeUpdate();
	}
	
	// select all
	pstatement = connection.prepareStatement(selectAllWidgets);
	results = pstatement.executeQuery();
	while(results.next()) {
		id = results.getInt("id");
		name = results.getString("name");
		content = results.getString("content");%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td><%= content %></td>
			<td>
				<a href="widgets.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="widgets.jsp?action=edit&id=<%= id %>">Edit</a>
			</td>
		</tr>
<%	}	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	try {
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

%>
</table>
</form>
</body>
</html>