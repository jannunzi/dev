<%@ page import="edu.neu.cs5200.mongo.*, edu.neu.cs5200.model.*, com.mongodb.*, java.util.*" %>

<h1>Developer Basic DB Object Save</h1>
<form action="14-developerBasicDBObjectSaveForm.jsp">
	First: <input name="first"/><br/>
	Last:  <input name="last"/><br/>
	Age:   <input name="age" type="number"/><br/>
	<button name="insert" type="submit">Insert</button>
</form>
<ul>
<%
	String first  = (String)request.getParameter("first");
	String last   = (String)request.getParameter("last");
	String ageStr = (String)request.getParameter("age");
	if(ageStr != null && !ageStr.equals("")) {
		int age = Integer.parseInt(ageStr);
		Developer developer = 
		new Developer(first, last, age);
		DeveloperBasicDBObjectSaveForm.insert(developer);
	}
%>
</ul>