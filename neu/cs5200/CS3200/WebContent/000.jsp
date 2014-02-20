<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String url = "jdbc:mysql://localhost/cs3200";
String driver = "com.mysql.jdbc.Driver";

Connection connection = null;
try {
	Class.forName (driver).newInstance();
	connection = DriverManager.getConnection (url, "root", null);
	out.println(connection);
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

</body>
</html>