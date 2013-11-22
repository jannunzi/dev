<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>Get Collection</h1>

<%
	DBCollection collection = GetCollection.getCollection("developers");
	out.println(collection);
%>
