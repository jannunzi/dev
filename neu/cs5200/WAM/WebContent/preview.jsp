<%@ page import="java.sql.*,edu.cs3200.jdbc.ds.wam.*,java.util.*,jga.*" %>

<link rel="Stylesheet" href="css/bootstrap.css" type="text/css"/>

<form action="preview.jsp" method="get">

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

%>	<a href="page.jsp?devId=<%= devId %>&appId=<%= appId %>&pageId=<%= pageId %>" class="btn btn-primary">&#9664;</a>
	<input type="hidden" name="devId" value="<%= devId %>"/>
	<input type="hidden" name="appId" value="<%= appId %>"/>
	<input type="hidden" name="pageId" value="<%= pageId %>"/>
<%

try {
	RowBean rowBean = new RowBean();

	action = request.getParameter("action");
	
	List<Row> rows = new ArrayList<Row>();
	newRow = new Row();

	if("delete".equals(action)) {
		rowBean.delete(id);
	} else if("add".equals(action)) {
		name = request.getParameter("name");
		newRow.name = name;
		newRow.pageId = pageId;
		rowBean.create(newRow);
	} else if("edit".equals(action)) {
		editId = Utils.parseInt(request.getParameter("id"));
	} else if("update".equals(action)) {
		name = request.getParameter("newName");
		newRow.id = id;
		newRow.name = name;
		rowBean.update(newRow);
	}
	if(pageIdStr == null){
		rows = rowBean.readList();
	} else {
		rows = rowBean.readList(pageId);
	}
	
	for(Row pg : rows) {
		id = pg.id;
		name = pg.name;
		
		if(id == editId) {
%>
			ID: <%= id %>
			<input name="newName" value="<%= name %>" class="form-control"/>
			<button name="action" value="update" class="btn btn-primary">Update</button>
			<a href="preview.jsp?devId=<%=devId %>&appId=<%=appId %>">Cancel</a>
			<input type="hidden" name="id" value="<%= id %>"/>
<%			
		} else {		
%>		
			<div class="row" id="row-<%= id %>-<%= name %>">
				<a href="preview.jsp?action=edit&id=<%= id %>&devId=<%=devId %>&appId=<%=appId %>&pageId=<%= pageId %>">Edit</a>
				<a style="float:right" href="preview.jsp?action=delete&id=<%= id %>&devId=<%=devId %>&appId=<%= appId %>&pageId=<%=pageId %>">Delete</a>
				<%= name %>
			</div>
<%		}
	}
} catch(Exception e) {
	e.printStackTrace();
}


%>
</div>

</form>