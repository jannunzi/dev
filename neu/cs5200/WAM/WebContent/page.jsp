<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="page.jsp" method="post">

<div class='container'>

<h2>Pages</h2>
<%

int id, appId = 1, devId = 1, editId = -1;
String name;
String action = null;
Page newPage = null;

try {
	PageBean pageBean = new PageBean();

	action = request.getParameter("action");
	
	List<Page> pages = new ArrayList<Page>();

	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		pageBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newPage = new Page(name);
		pageBean.create(newPage);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		name = request.getParameter("newName");
		newPage = new Page(id, name);
		pageBean.update(newPage);
	} else if("filter".equals(action)) {
		appId = Utils.parseInt(request.getParameter("appId"));
		devId = Utils.parseInt(request.getParameter("devId"));
		pages = pageBean.readList(appId);
%>		<a href="application.jsp?action=filter&devId=<%=devId %>" class="btn btn-primary">Application</a>
		<br/>
<%	} else {
		pages = pageBean.readList();
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
	for(Page pg : pages) {
		id = pg.id;
		name = pg.name;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="page.jsp">Cancel</a>
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
				<a href="page.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="page.jsp?action=edit&id=<%= id %>">Edit</a>
				<a href="region.jsp?action=filter&pageId=<%= id %>&appId=<%= appId %>&devId=<%= devId %>">Children</a>
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