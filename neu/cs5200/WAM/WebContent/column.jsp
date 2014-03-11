<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>

<form action="column.jsp" method="get">

<div class='container'>

<%
int id = Utils.parseInt(request.getParameter("id"));
int editId = -1;
String name;
String action = null;
Column newColumn = null;

String devIdStr = request.getParameter("devId");
int devId = Utils.parseInt(devIdStr);
String appIdStr = request.getParameter("appId");
int appId = Utils.parseInt(appIdStr);
String pageIdStr = request.getParameter("pageId");
int pageId = Utils.parseInt(pageIdStr);
String rowIdStr = request.getParameter("rowId");
int rowId = Utils.parseInt(rowIdStr);

%>	<h2>
	<a href="row.jsp?rowId=<%= rowId %>&devId=<%= devId %>&appId=<%= appId %>&pageId=<%= pageId %>" class="btn btn-primary">&#9664;</a>
	Columns
	</h2>
	<input type="hidden" name="devId"  value="<%= devId %>"/>
	<input type="hidden" name="appId"  value="<%= appId %>"/>
	<input type="hidden" name="pageId" value="<%= pageId %>"/>
	<input type="hidden" name="rowId"  value="<%= rowId %>"/>
<%

try {
	ColumnBean columnBean = new ColumnBean();

	action = request.getParameter("action");
	
	List<Column> columns = new ArrayList<Column>();
	newColumn = new Column();

	if("delete".equals(action)) {
		columnBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newColumn.name = name;
		newColumn.rowId = rowId;
		columnBean.create(newColumn);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		name = request.getParameter("newName");
		newColumn.id = id;
		newColumn.name = name;
		columnBean.update(newColumn);
	}
	if(rowIdStr == null){
		columns = columnBean.readList();
	} else {
		columns = columnBean.readList(rowId);
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
	for(Column col : columns) {
		id = col.id;
		name = col.name;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="column.jsp?devId=<%=devId %>&appId=<%=appId %>&rowId=<%= rowId %>&pageId=<%= pageId %>">Cancel</a>
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
				<a href="column.jsp?action=delete&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>&rowId=<%= rowId %>">Delete</a>
				<a href="column.jsp?action=edit&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>&rowId=<%= rowId %>">Edit</a>
				<a href="widget.jsp?devId=<%=devId %>&appId=<%=appId %>&pageId=<%= pageId %>&rowId=<%= rowId %>&colId=<%= id %>">Widgets</a>
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