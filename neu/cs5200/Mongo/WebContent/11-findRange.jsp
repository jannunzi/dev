<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>Find Range</h1>

<ul>
<%
	DBCursor cursor = FindRange.find();
	while(cursor.hasNext()){
		%><li><%= cursor.next() %></li><%
	}
%>
</ul>