<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*" %>

<h1>Get Database</h1>

<%
	DB db = GetDatabase.getDB();
	out.println(db);
%>