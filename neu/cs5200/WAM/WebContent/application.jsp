<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="application.jsp" method="post">

<div class='container'>

<h2>Applications
</h2>
<a href="developer.jsp" class="btn btn-primary">Developer</a>
<br/>
<%

int id, devId = 1, editId = -1;
String name;
String action = null;
Application newApplication = null;

try {
	ApplicationBean applicationBean = new ApplicationBean();

	action = request.getParameter("action");
	
	List<Application> applications = new ArrayList<Application>();
	
	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		applicationBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newApplication = new Application(name);
		applicationBean.create(newApplication);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		name = request.getParameter("newName");
		newApplication = new Application(id, name);
		applicationBean.update(newApplication);
	} else if("filter".equals(action)) {
		devId = Utils.parseInt(request.getParameter("devId"));
		applications = applicationBean.readList(devId);		
	} else {
		applications = applicationBean.readList();		
	}
	
%>
	<table class="table">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Controls</th>
		</tr>
		<tr>
			<th></th>
			<th><input name="name" class="form-control" placeholder="Name"/></th>
			<th><button name="action" value="add" class="btn btn-primary">Add</button></th>
		</tr>
<%
	for(Application app : applications) {
		id = app.id;
		name = app.name;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="application.jsp">Cancel</a>
				<input type="hidden" name="id" value="<%= id %>"/>
			</td>
		</tr>
<%
		} else {		
%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td>
				<a href="application.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="application.jsp?action=edit&id=<%= id %>">Edit</a>
				<a href="page.jsp?action=filter&appId=<%= id %>&devId=<%= devId %>">Children</a>
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