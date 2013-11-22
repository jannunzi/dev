<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*" %>

<h1>Connecting to Mongo</h1>

<%
	Mongo client = ConnectToMongo.connect();
	out.println(client);
%>