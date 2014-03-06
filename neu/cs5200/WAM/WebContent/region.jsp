<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="region.jsp" method="get">

<div class='container'>

<h2>Regions</h2>

<%

int id, appId=1, devId=1, pageId=1, top, left, width, height, editId = -1;
String name, bgColor, fgColor, content;
String action = null;
Region newRegion = null;

try {
	RegionBean regionBean = new RegionBean();

	action = request.getParameter("action");

	List<Region> regions = new ArrayList<Region>();
	
	if("delete".equals(action)) {
		id = Utils.parseInt(request.getParameter("id"));
		regionBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		content = request.getParameter("content");
		top = Utils.parseInt(request.getParameter("top"));
		left = Utils.parseInt(request.getParameter("top"));
		height = Utils.parseInt(request.getParameter("top"));
		width = Utils.parseInt(request.getParameter("top"));
		bgColor = request.getParameter("bgColor");
		fgColor = request.getParameter("fgColor");
		newRegion = new Region(name, content, top, left, width, height, bgColor, fgColor);
		regionBean.create(newRegion);
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
		newRegion = new Region(id, name, content, top, left, width, height, bgColor, fgColor);
		regionBean.update(newRegion);
	} else if("filter".equals(action)) {
		appId = Utils.parseInt(request.getParameter("appId"));
		devId = Utils.parseInt(request.getParameter("devId"));
		pageId = Utils.parseInt(request.getParameter("pageId"));
		regions = regionBean.readList(pageId);
%>		<a href="page.jsp?action=filter&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>" class="btn btn-primary">Page</a>
		<br/>
<%	} else {
		regions = regionBean.readList();
	}
	
	
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
	for(Region region : regions) {
		id = region.id;
		name = region.name;
		content = region.content;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td><input name="newContent" value="<%= content %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="region.jsp">Cancel</a>
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
				<a href="region.jsp?action=delete&id=<%= id %>">Delete</a>
				<a href="region.jsp?action=edit&id=<%= id %>">Edit</a>
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