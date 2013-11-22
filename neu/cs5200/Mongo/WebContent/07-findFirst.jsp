<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Find One</h1>

<%
	DBObject obj = FindFirst.first();
%>

<pre>
<%= obj %>
</pre>