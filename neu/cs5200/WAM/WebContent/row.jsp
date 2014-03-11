<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>

<form action="row.jsp" method="get">

<div class='container'>

<%
int id = Utils.parseInt(request.getParameter("id"));
int editId = -1;
String name;
String action = null;
Row newRow = null;

String devIdStr = request.getParameter("devId");
int devId = Utils.parseInt(devIdStr);
String appIdStr = request.getParameter("appId");
int appId = Utils.parseInt(appIdStr);
String pageIdStr = request.getParameter("pageId");
int pageId = Utils.parseInt(pageIdStr);

%>	<h2>
	<a href="page.jsp?devId=<%= devId %>&appId=<%= appId %>&pageId=<%= pageId %>" class="btn btn-primary">&#9664;</a>
	Rows
	</h2>
	<input type="hidden" name="devId" value="<%= devId %>"/>
	<input type="hidden" name="appId" value="<%= appId %>"/>
	<input type="hidden" name="pageId" value="<%= pageId %>"/>
<%

try {
	RowBean pageBean = new RowBean();

	action = request.getParameter("action");
	
	List<Row> rows = new ArrayList<Row>();
	newRow = new Row();

	if("delete".equals(action)) {
		pageBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newRow.name = name;
		newRow.pageId = pageId;
		pageBean.create(newRow);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		name = request.getParameter("newName");
		newRow.id = id;
		newRow.name = name;
		pageBean.update(newRow);
	}
	if(pageIdStr == null){
		rows = pageBean.readList();
	} else {
		rows = pageBean.readList(pageId);
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
	for(Row pg : rows) {
		id = pg.id;
		name = pg.name;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="row.jsp?devId=<%=devId %>&appId=<%=appId %>">Cancel</a>
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
				<a href="row.jsp?action=delete&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>">Delete</a>
				<a href="row.jsp?action=edit&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>">Edit</a>
				<a href="column.jsp?rowId=<%= id %>&pageId=<%= id %>&appId=<%= appId %>&devId=<%= devId %>">Columns</a>
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