<%@ page import="edu.neu.cs5200.mongo.*, com.mongodb.*, java.util.*" %>

<h1>Find Range Form</h1>
<form action="12-findRangeForm.jsp">
	Min Age: <input name="min" type="number"/><br/>
	Max Age: <input name="max" type="number"/><br/>
	<button type="submit" name="findRange">Find Range</button><br/>
</form>
<ul>
<%
	String minStr = (String)request.getParameter("min");
	String maxStr = (String)request.getParameter("max");
	if(minStr != null) {
		int min = Integer.parseInt(minStr);
		int max = Integer.parseInt(maxStr);
		DBCursor cursor = FindRangeForm.find(min, max);
		while(cursor.hasNext()){
			%><li><%= cursor.next() %></li><%
		}
	}
%>
</ul>