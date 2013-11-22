<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>CRUD</h1>

<form action="20-crud.jsp">
	Id:    <input name="id"    value="<%= request.getParameter("id")    %>"/><br/>
	First: <input name="first" value="<%= request.getParameter("first") %>"/><br/>
	Last:  <input name="last"  value="<%= request.getParameter("last")  %>"/><br/>
	Age:   <input name="age"   value="<%= request.getParameter("age")   %>" type="number"/><br/>
	<button name="command" value="insert" type="submit">insert</button>
	<button name="command" value="update" type="submit">update</button>
</form>

<table>
	<tr>
		<th>First</th>
		<th>Last</th>
		<th>Age</th>
		<th>Id</th>
		<th>&nbsp;</th>
	</tr>
<%
	String command = (String)request.getParameter("command");
	String id      = (String)request.getParameter("id");
	String first   = (String)request.getParameter("first");
	String last    = (String)request.getParameter("last");
	String ageStr  = (String)request.getParameter("age");
	int age        = 0;
	if(ageStr != null && ageStr != "") {
		age = Integer.parseInt(ageStr);
	}
	if("delete".equals(command)) {
		CRUD.remove(id);
	} else if("insert".equals(command)) {
		Developer developer = new Developer(first, last, age, null);
		CRUD.insert(developer);
	} else if("update".equals(command)) {
		Developer developer = new Developer(first, last, age, id);
		CRUD.update(developer);
	}
	List<Developer> developers = CRUD.loadAll();
	for(Developer developer : developers) {
%>		<tr>
			<td><%= developer.getFirst() %></td>
			<td><%= developer.getLast() %></td>
			<td><%= developer.getAge() %></td>
			<td><%= developer.getId() %></td>
			<td>
				<a href="20-crud.jsp?command=edit&id=<%= developer.getId() %>&first=<%= developer.getFirst() %>&last=<%= developer.getLast() %>&age=<%= developer.getAge() %>">Edit</a>
				<a href="20-crud.jsp?command=delete&id=<%= developer.getId() %>">Delete</a>
			</td>
		</tr>
<%	}
%>
</table>