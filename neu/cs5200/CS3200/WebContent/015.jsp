<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table>

<%
String url = "jdbc:mysql://localhost/cs3200";
String driver = "com.mysql.jdbc.Driver";

Connection connection = null;
try {
	Class.forName (driver).newInstance();
	connection = DriverManager.getConnection (url, "root", null);
	
	String sql = "SELECT * FROM DEVELOPER";
	Statement statement = connection.createStatement();
	ResultSet results = statement.executeQuery(sql);
	
	while(results.next()){
		int id = results.getInt("id");
		String fName = results.getString("firstName");
		String lName = results.getString("lastName");
		float salary = results.getFloat("salary");
%>		<tr>
			<td><%= id %></td>
			<td><%= fName %></td>
			<td><%= lName %></td>
			<td>$<%= salary %></td>
		</tr>
<%
	}
	
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

</table>

</body>
</html>