<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Developer Basic DB Object Load All</h1>
<ul>
<%
	List<Developer> developers = DeveloperBasicDBObjectLoadAll.loadAll();
	for(Developer developer : developers) {
%>	<li><%= developer %></li>
<%	}
%>
</ul>