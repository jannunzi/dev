<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>


<form action="page.jsp" method="get">

<div class='container'>

<%
int id = Utils.parseInt(request.getParameter("id"));
int editId = -1;
String name;
String action = null;
Page newPage = null;
String devIdStr = request.getParameter("devId");
int devId = Utils.parseInt(devIdStr);
String appIdStr = request.getParameter("appId");
int appId = Utils.parseInt(appIdStr);

%>	<h2>
	<a href="application.jsp?devId=<%=devId %>&appId=<%=appId %>" class="btn btn-primary">&#9664;</a>
	Pages
	</h2>
	<input type="hidden" name="devId" value="<%= devId %>"/>
	<input type="hidden" name="appId" value="<%= appId %>"/>
<%

try {
	PageBean pageBean = new PageBean();

	action = request.getParameter("action");
	
	List<Page> pages = new ArrayList<Page>();
	newPage = new Page();

	if("delete".equals(action)) {
		pageBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newPage.name = name;
		newPage.appId = appId;
		pageBean.create(newPage);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		name = request.getParameter("newName");
		newPage.id = id;
		newPage.name = name;
		pageBean.update(newPage);
	}
	if(appIdStr == null){
		pages = pageBean.readList();
	} else {
		pages = pageBean.readList(appId);
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
				<a href="page.jsp?devId=<%=devId %>&appId=<%=appId %>">Cancel</a>
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
				<a href="page.jsp?action=delete&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>">Delete</a>
				<a href="page.jsp?action=edit&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>">Edit</a>
				<a href="preview.jsp?devId=<%=devId %>&appId=<%=appId %>&pageId=<%= id %>">Preview</a>
				<a href="region.jsp?devId=<%=devId %>&appId=<%=appId %>&pageId=<%= id %>&devId=<%= devId %>">Regions</a>
				<a href="row.jsp?devId=<%=devId %>&appId=<%=appId %>&pageId=<%= id %>&devId=<%= devId %>">Rows</a>
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