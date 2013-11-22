<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>Find Filtered</h1>

<ul>
<%
	DBCursor cursor = FindFiltered.find();
	while(cursor.hasNext()){
		%><li><%= cursor.next() %></li><%
	}
%>
</ul>