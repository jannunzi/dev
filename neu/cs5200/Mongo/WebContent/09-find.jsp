<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>Iterate Over Cursor</h1>

<ul>
<%
	DBCursor cursor = Find.all();
	while(cursor.hasNext()){
		%><li><%= cursor.next() %></li><%
	}
%>
</ul>