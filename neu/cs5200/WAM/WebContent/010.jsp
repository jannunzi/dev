<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="010.jsp" method="get">

<div class='container'>

<h2>Widgets</h2>

<a href="010.jsp?action=preview">Preview</a>

<%
	int id, top, left, width, height, editId = -1;
String name, bgColor, fgColor, content;
String action = null;
Region newWidget = null;

try {
	RegionBean widgetBean = new RegionBean();

	action = request.getParameter("action");

	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		widgetBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		content = request.getParameter("content");
		top = Utils.parseInt(request.getParameter("top"));
		left = Utils.parseInt(request.getParameter("top"));
		height = Utils.parseInt(request.getParameter("top"));
		width = Utils.parseInt(request.getParameter("top"));
		bgColor = request.getParameter("bgColor");
		fgColor = request.getParameter("fgColor");
		newWidget = new Region(name, content, top, left, width, height, bgColor, fgColor);
		widgetBean.create(newWidget);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		name = request.getParameter("newName");
		content = request.getParameter("newContent");
		top = Utils.parseInt(request.getParameter("top"));
		left = Utils.parseInt(request.getParameter("top"));
		height = Utils.parseInt(request.getParameter("top"));
		width = Utils.parseInt(request.getParameter("top"));
		bgColor = request.getParameter("bgColor");
		fgColor = request.getParameter("fgColor");
		newWidget = new Region(id, name, content, top, left, width, height, bgColor, fgColor);
		widgetBean.update(newWidget);
	}
	
	List<Region> widgets = widgetBean.readList();
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
			<th><input name="name" class="form-control" placeholder="Name"/></th>
			<th><input name="content" class="form-control" placeholder="Content"/></th>
			<th><button name="action" value="add" class="btn btn-primary">Add</button></th>
		</tr>
<%
	for(Region widget : widgets) {
		id = widget.id;
		name = widget.name;
		content = widget.content;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td><input name="newContent" value="<%= content %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="010.jsp">Cancel</a>
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
				<a href="010.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="010.jsp?action=edit&id=<%= id %>">Edit</a>
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