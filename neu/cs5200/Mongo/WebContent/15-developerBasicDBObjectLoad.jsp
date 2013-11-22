<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Developer Basic DB Object Load</h1>

<%
	Developer developer = DeveloperBasicDBObjectLoad.load();
%>	<%= developer %>
