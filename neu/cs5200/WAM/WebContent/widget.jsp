<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>

<form action="widget.jsp" method="get">

<div class='container'>

<%
int id = Utils.parseInt(request.getParameter("id"));
int editId = -1;
String name;
String action = null;
Widget newWidget = null;

String devIdStr = request.getParameter("devId");
int devId = Utils.parseInt(devIdStr);
String appIdStr = request.getParameter("appId");
int appId = Utils.parseInt(appIdStr);
String pageIdStr = request.getParameter("pageId");
int pageId = Utils.parseInt(pageIdStr);
String rowIdStr = request.getParameter("rowId");
int rowId = Utils.parseInt(rowIdStr);
String colIdStr = request.getParameter("colId");
int colId = Utils.parseInt(colIdStr);

%>	<h2>
	<a href="column.jsp?devId=<%= devId %>&appId=<%= appId %>&pageId=<%= pageId %>&rowId=<%= rowId %>&colId=<%= colId %>" class="btn btn-primary">&#9664;</a>
	Widgets
	</h2>
	<input type="hidden" name="devId"  value="<%= devId %>"/>
	<input type="hidden" name="appId"  value="<%= appId %>"/>
	<input type="hidden" name="pageId" value="<%= pageId %>"/>
	<input type="hidden" name="rowId"  value="<%= rowId %>"/>
	<input type="hidden" name="colId"  value="<%= colId %>"/>
<%

try {
	WidgetBean widgetBean = new WidgetBean();

	action = request.getParameter("action");
	
	List<Widget> widgets = new ArrayList<Widget>();
	newWidget = new Widget();

	if("delete".equals(action)) {
		widgetBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newWidget.name = name;
		newWidget.colId = colId;
		widgetBean.create(newWidget);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		name = request.getParameter("newName");
		newWidget.id = id;
		newWidget.name = name;
		newWidget.colId = colId;
		widgetBean.update(newWidget);
	}
	if(colIdStr == null){
		widgets = widgetBean.readList();
	} else {
		widgets = widgetBean.readList(colId);
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
	for(Widget wdgt : widgets) {
		id = wdgt.id;
		name = wdgt.name;

		if(id == editId) {
%>
		<tr>
			<td><%= id %></td>
			<td><input name="newName" value="<%= name %>" class="form-control"/></td>
			<td>
				<button name="action" value="update" class="btn btn-primary">Update</button>
				<a href="widget.jsp?devId=<%=devId %>&appId=<%=appId %>&pageId=<%= pageId %>&rowId=<%= rowId %>&colId=<%= colId %>">Cancel</a>
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
				<a href="widget.jsp?action=delete&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>&rowId=<%= rowId %>&colId=<%= colId %>">Delete</a>
				<a href="widget.jsp?action=edit&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%=pageId %>&rowId=<%= rowId %>&colId=<%= colId %>">Edit</a>
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