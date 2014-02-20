<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<form action="developer.jsp">
<div class="container">
	
	<table class="table">
	
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Salary</th>
			<th>Controls</th>
		</tr>
	
		<tr>
			<td></td>
			<td><input type="text" name="firstName" class="form-control"/></t>
			<td><input type="text" name="lastName" class="form-control"/></t>
			<td><input type="number" name="salary" class="form-control"/></t>
			<td><button type="submit" name="action" value="create" class="btn btn-primary">Add Developer</button></td>
		</tr>
	
	<%
	String url = "jdbc:mysql://localhost/cs3200";
	String driver = "com.mysql.jdbc.Driver";
	String sql = null;
	Statement statement = null;
	PreparedStatement pstatement = null;
	ResultSet results = null;
	Connection connection = null;
	String findAllSql = "SELECT * FROM DEVELOPER";
	String createDeveloper = "INSERT INTO DEVELOPER VALUES (NULL, ?, ?, ?)";
	String deleteDeveloper = "DELETE FROM DEVELOPER WHERE ID=?";
	String updateDeveloper = "UPDATE DEVELOPER SET FIRSTNAME=?, LASTNAME=?, SALARY=? WHERE ID=?";
	String firstName, lastName, firstNameUpdate, lastNameUpdate;
	int id = -1;
	int idEdit = -1;
	float salary, salaryUpdate;
	
	try {
		Class.forName (driver).newInstance();
		connection = DriverManager.getConnection (url, "root", null);
		statement = connection.createStatement();
		
		String action = request.getParameter("action");
		if("create".equals(action)) {
			firstName = request.getParameter("firstName");
			lastName = request.getParameter("lastName");
			salary = Float.parseFloat(request.getParameter("salary"));
			pstatement = connection.prepareStatement(createDeveloper);
			pstatement.setString(1, firstName);
			pstatement.setString(2, lastName);
			pstatement.setFloat(3, salary);
			pstatement.execute();
		} else if("delete".equals(action)){
			id = Integer.parseInt(request.getParameter("id"));
			pstatement = connection.prepareStatement(deleteDeveloper);
			pstatement.setInt(1, id);
			pstatement.execute();
		} else if("edit".equals(action)) {
			idEdit = Integer.parseInt(request.getParameter("id"));
		} else if("update".equals(action)) {
			id = Integer.parseInt(request.getParameter("id"));
			firstNameUpdate = request.getParameter("firstNameUpdate");
			lastNameUpdate = request.getParameter("lastNameUpdate");
			salaryUpdate = Float.parseFloat(request.getParameter("salaryUpdate"));
			pstatement = connection.prepareStatement(updateDeveloper);
			pstatement.setString(1, firstNameUpdate);
			pstatement.setString(2, lastNameUpdate);
			pstatement.setFloat(3, salaryUpdate);
			pstatement.setInt(4, id);
			pstatement.execute();
		}
		
		results = statement.executeQuery(findAllSql);
		while(results.next()){
			id = results.getInt("id");
			firstName = results.getString("firstName");
			lastName = results.getString("lastName");
			salary = results.getFloat("salary");
			if(id == idEdit) {
	%>		<tr>
				<td><%= id %></td>
				<td><input type="text" value="<%= firstName %>" name="firstNameUpdate" class="form-control"/></td>
				<td><input type="text" value="<%= lastName %>" name="lastNameUpdate" class="form-control"/></td>
				<td><input type="number" value="<%= salary %>" name="salaryUpdate" class="form-control"/></td>
				<td>
					<button name="action" value="update" class="btn btn-primary">Update</button>
					<input type="hidden" name="id" value="<%= id %>"/>
				</td>
			</tr>
	<%		
			} else {
	%>		<tr>
				<td><%= id %></td>
				<td><%= firstName %></td>
				<td><%= lastName %></td>
				<td>$<%= salary %></td>
				<td>
					<a href="developer.jsp?action=delete&id=<%= id %>">Delete</a>
					<a href="developer.jsp?action=edit&id=<%= id %>">Edit</a>
				</td>
			</tr>
	<%		
			}
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

</div>
</form>
</body>
</html>