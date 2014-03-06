<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="020.jsp" method="post">

<div class='container'>

<h2>Developers</h2>

<a href="020.jsp?action=preview">Preview</a>

<%

int id, editId = -1;
String firstName;
String lastName;
float  salary;
String action = null;
Developer newDeveloper = null;

try {
	DeveloperBean developerBean = new DeveloperBean();

	action = request.getParameter("action");

	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		developerBean.delete(id);
	} else if("add".equals(action)) {
		firstName = request.getParameter("firstName");
		lastName = request.getParameter("lastName");
		salary = Utils.parseFloat(request.getParameter("salary"));
		newDeveloper = new Developer(firstName, lastName, salary);
		developerBean.create(newDeveloper);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		firstName = request.getParameter("newFirstName");
		lastName = request.getParameter("newLastName");
		salary = Utils.parseFloat(request.getParameter("newSalary"));
		newDeveloper = new Developer(id, firstName, lastName, salary);
		developerBean.update(newDeveloper);
	}
	
	List<Developer> developers = developerBean.readList();
	
%>
	<table class="table">
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Salary</th>
			<th>Controls</th>
		</tr>
		<tr>
			<th></th>
			<th><input name="firstName" class="form-control" placeholder="First Name"/></th>
			<th><input name="lastName" class="form-control" placeholder="Last Name"/></th>
			<th><input name="salary" class="form-control" placeholder="Salary"/></th>
			<th><button name="action" value="add" class="btn btn-primary">Add</button></th>
		</tr>
<%
	for(Developer app : developers) {
		id = app.id;
		firstName = app.firstName;
		lastName = app.lastName;
		salary = app.salary;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newFirstName" value="<%= firstName %>" class="form-control"/></td>
			<td><input name="newLastName" value="<%= lastName %>" class="form-control"/></td>
			<td><input name="newSalary" value="<%= salary %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="020.jsp">Cancel</a>
				<input type="hidden" name="id" value="<%= id %>"/>
			</td>
		</tr>
<%
		} else {		
%>
		<tr>
			<td><%= id %></td>
			<td><%= firstName %></td>
			<td><%= lastName %></td>
			<td><%= salary %></td>
			<td>
				<a href="020.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="020.jsp?action=edit&id=<%= id %>">Edit</a>
			</td>
		</tr>

<%		}
	}
%>
	</table>
<%
	
} catch(Exception e) {
	e.printStackTrace();
}


%>
</div>

</form>