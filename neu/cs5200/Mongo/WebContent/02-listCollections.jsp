<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>List Collections</h1>

<ul>
<%
	Set<String> collections = ListCollections.list();
	for(String collectionName : collections) {
		%><li><%= collectionName %></li><%
	}
%>
</ul>