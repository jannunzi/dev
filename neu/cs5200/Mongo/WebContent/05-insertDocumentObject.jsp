<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Insert Document Object</h1>

<%
	DeveloperPOJO developer = new DeveloperPOJO("James","Cameron", 59);
	InsertDocumentObject.insert(developer);
%>

Inserted <%= developer.first %> <%= developer.last %> 