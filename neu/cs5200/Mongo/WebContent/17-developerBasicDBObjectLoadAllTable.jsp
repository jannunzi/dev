<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Developer Basic DB Object Load All Table</h1>
<table>
	<tr>
		<th>First</th>
		<th>Last</th>
		<th>Age</th>
	</tr>
<%
	List<Developer> developers = DeveloperBasicDBObjectLoadAll.loadAll();
	for(Developer developer : developers) {
%>		<tr>
			<td><%= developer.getFirst() %></td>
			<td><%= developer.getLast() %></td>
			<td><%= developer.getAge() %></td>
		</tr>
<%	}
%>
</table>