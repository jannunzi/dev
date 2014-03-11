<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="application.jsp" method="get">

<div class='container'>

<h2>
<a href="developer.jsp" class="btn btn-primary">&#9664;</a>
Applications
</h2>
<%

int id, editId = -1;
String name;
String action = null;
String devIdStr = request.getParameter("devId");
int devId = Utils.parseInt(devIdStr);
Application newApplication = null;

try {
	ApplicationBean applicationBean = new ApplicationBean();

	action = request.getParameter("action");
	
	List<Application> applications = new ArrayList<Application>();
	newApplication = new Application();
	
	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		applicationBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newApplication.name = name;
		newApplication.devId = devId;
		applicationBean.create(newApplication);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		name = request.getParameter("newName");
		newApplication.id = id;
		newApplication.name = name;
		newApplication.devId = devId;
		applicationBean.update(newApplication);
//	} else if("filter".equals(action)) {
//		devId = Utils.parseInt(request.getParameter("devId"));
//		applications = applicationBean.readList(devId);		
	}
//	else {
	if(devIdStr == null){
		applications = applicationBean.readList();		
	} else {
		devId = Utils.parseInt(request.getParameter("devId"));
		applications = applicationBean.readList(devId);		
	}
//	}
	
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
			<th>
				<button name="action" value="add" class="btn btn-primary">Add</button>
				<input type="hidden" name="devId" value="<%= devId %>"/>
			</th>
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
				<a href="application.jsp?devId=<%= devId %>">Cancel</a>
				<input type="hidden" name="id" value="<%= id %>"/>
				<input type="hidden" name="devId" value="<%= devId %>"/>
			</td>
		</tr>
<%
		} else {		
%>
		<tr>
			<td><%= id %></td>
			<td><%= name %></td>
			<td>
				<a href="application.jsp?action=delete&id=<%= id %>&devId=<%= devId %>">Delete</a>
				<a href="application.jsp?action=edit&id=<%= id %>&devId=<%= devId %>">Edit</a>
				<a href="page.jsp?appId=<%= id %>&devId=<%= devId %>">Pages</a>
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